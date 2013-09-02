class Episode < ActiveRecord::Base

  belongs_to :client
  has_many :allocations
  has_many :episode_contacts
  has_and_belongs_to_many :venues
  has_and_belongs_to_many :practitioners # This is PREFERRED practitioners for this episode
  
  validates :referral_date, presence: true

	S_ALLOCATED = "Allocated"
	S_UNALLOCATED = "Unallocated"
	S_UNDERWAY = "in progress"
	S_PENDING = "pending"
	S_WAITING = "Waiting"
	S_WAITING_ALLOC = "Waiting allocation"
	S_ASSESSMENT = "assessment"
	S_TREATMENT = "treatment"
	S_CLOSED = "Closed"
	S_COMPLETE = "complete"

  def create_file_no(a)
    self.file_no = sprintf("%02d/%04d", self.referral_date.year.modulo(100), FileNo.next_file_no(a))
  end

  def allocated?
    (!self.allocations.nil?) || (self.allocations.count > 0)
  end
  
  def lastallocation
    self.allocations.last
  end

	def currentallocation
		self.allocations.last
	end
	

	def practitioner
  	if self.allocated?
    	self.lastallocation.practitioner
    end
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
    # Episode allocated appointments due	  				$allocationtype in progress
    # Episode allocated appointments past not DNA
    # 			allocation type is assessment						Waiting treatment
    # 			allocation type is treatment						In treatment

    if self.closed?
			status << S_CLOSED
    else
			lastalloc = self.allocations.last
			if lastalloc.nil? # not allocated				# Not allocated - status is "Unallocated"
#				status << S_WAITING
#				status << S_ASSESSMENT
				status << S_UNALLOCATED
			else # it's allocated
				if lastalloc.appointments.last.nil? 	# Allocated but no appointments - status is "Waiting <allocation type>"
					status << S_WAITING
					status << lastalloc.description			
				else 																	# Allocated with appointments
					a = lastalloc.appointments.first  	
					if a.appointment_start.future?			# Last appointment in future? If so, still allocated
						status << lastalloc.description		# so status is "$allocationtype in progress/pending"
						unless lastalloc.appointments.last.appointment_date.future?	# there have been earlier appointments
							status << S_UNDERWAY
						else
							status << S_PENDING
						end
					else																# Appointment in past
						status << lastalloc.description
						status << S_COMPLETE
					end

				end
			end
    end
    status.join(' ')
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
