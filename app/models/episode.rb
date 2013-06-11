class Episode < ActiveRecord::Base

  belongs_to :client
  has_many :allocations
  has_many :episode_contacts
  has_and_belongs_to_many :venues
  has_and_belongs_to_many :practitioners

	S_ALLOCATED = "Allocated"
	S_BOOKED = "Booked"
	S_WAITING = "Waiting"
	S_WAITING_ALLOC = "Waiting allocation"
	S_ASSESSMENT = "assessment"
	S_TREATMENT = "treatment"
	S_CLOSED = "Closed"

  def create_file_no(a)
    self.file_no = sprintf("%02d/%04d", self.referral_date.year.modulo(100), FileNo.next_file_no(a))
  end

  def lastallocation
    self.allocations.last
  end

  def waitstartdate
    startdate = nil

    if lastallocation.nil? # it's a new referral - IA waiting list
      puts "New referral"
      startdate = self.referral_date
    else # We have an allocation record
      if lastallocation.allocation_type.is_assessment # it's an allocation, but an IA one

        startdate = self.referral_date
        # Check to see if it's been done (and therefore a counselling wait)
        lastappt = lastallocation.lastappointment
        unless lastappt.nil?
          # OK, we have an appointment - if its outcome is 'Counselling' then we need the date
          if lastappt.outcome == 'Counselling'
            startdate = lastappt.appointment_date
          end
        end
      elsif lastallocation.allocation_type == 'Counselling' # it's a counselling referral
        # OK, if we have an appointment, we shouldn't be here.
        # If we don't, then we need the date of the IA.
        # So search for the latest IA for this episode, and get the date of the last appointment.
        # We're in schtuck if there isn't one!
        self.allocations.reverse_each do |a|
          if a.allocation_type.is_assessment
            appt=a.appointments.last
            startdate = appt.appointment_date unless appt.nil?
            break
          end
        end
      end # allocation type
    end
    startdate
  end

  def waitingliststatus
		status = []
    #
    # Allocation sequence             	   					Status
    # Episode created (unallocated)     	 					Waiting assessment
    # Episode allocated no appointments  						Allocated $allocationtype
    # Episode allocated appointments due	  				Booked $allocationtype
    # Episode allocated appointments past not DNA
    # 			allocation type is assessment						Waiting treatment
    # 			allocation type is treatment						In treatment

		lastalloc = self.allocations.last

    if self.closed?
			status << S_CLOSED
    else
			if lastalloc.nil? # not allocated
				status << S_WAITING
				status << S_ASSESSMENT
			else # it's allocated
				if lastalloc.appointments.last.nil? 	# no appointments
					status << S_ALLOCATED
					status << lastalloc.description				# so status is "Allocated $allocationtype"
				else 																	# appointments
					a = lastalloc.appointments.last	  	# in future? If so, still allocated
					if a.appointment_start.future?
						status << S_BOOKED
						status << lastalloc.description				# so status is "Allocated $allocationtype"
					else																		# Appointment in past
						if lastalloc.is_assessment?
							status << S_WAITING
							status << S_TREATMENT
						else
							status << "In #{S_TREATMENT}"
						end
					end

				end
			end
    end
    status.join(' for ')
  end

  def is_allocated_no_appointment?
		unless lastallocation.nil?
			(lastallocation.appointments.count == 0)
		else
			false
		end
  end

	def allocated_to
		unless lastallocation.nil?
			lastallocation.practitioner.fullname
		end
	end

end
