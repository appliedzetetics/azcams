class Appointment < ActiveRecord::Base
  belongs_to :allocation
	belongs_to :appointment_status
	belongs_to :slot_date
	has_and_belongs_to_many :templates

	attr_accessible :allocation_id, :outcome, :counted, :slot, :allocation, :appointment_status_id, :slot_date_id

	validates :appointment_date, presence: true
	validates :appointment_time, presence: true

	validates_date :appointment_date

	has_event_calendar :start_at_field => :appointment_start, :end_at_field => :appointment_end


#  default_scope order('appointment_date DESC, appointment_time DESC')
  
#  scope :account, lambda { |a| joins(:allocation => :practitioner).where("users.account_id=?", a) }

	def self.freeappointments(allocation_type, practitioner=nil,venue=nil)
		Appointment.where(allocation_type: allocation_type).where(allocation: nil)
	
	end



  #
  # Find appointment slots
  # ----------------------
  # Do a brute-force search from now until now+3 weeks, looking for clinics on
  # each day (if necessary that match practitioner and venue), excluding any for
  # which appointments (or virtual appointments) already exist, and returning the
  # result in an array.
  #
  def self.available_appointments(allocation, practitioner, venue)
    search_start = Date.today
    search_end = search_start + 3.weeks

    appointments = []
    search_start.to_date.upto(search_end) do |day|
      # going to have to add in venue and practitioner search here, too
      clinics = Clinic.where(:day_of_week => day.wday) # 0 = sunday
      next if clinics.nil?

      unless practitioner.nil?
        clinics = clinics.where(:practitioner_id => practitioner)
      end
      next if clinics.nil?

      unless venue.nil?
        clinics = clinics.where(:venue_id => venue)
      end
      next if clinics.nil?

      clinics.each do |c|
        #
        # Check through slots for clinic
        #
        c.slots.each do |s|

          if s.available?(day)
            #
            # Also need to check if there are enough free slots after this appointment
            # for the number of appointments for this allocation type
            #
            appointments << Appointment.new(
              :allocation => allocation,
              :slot => s,
              :appointment_date => day

            )
          end
        end # slot
      end # clinic
    end # day

    return appointments
  end

	#
	# Virtual fields
	#
	def status
		unless self.appointment_status.nil?
			self.appointment_status.description
		end
	end

	def allocation_type
	  self.allocation.description
	end
	
	def appointment_date
		self.slot_date.appointment_date
	end
	
	def appointment_time
		self.slot_date.slot.start_time
	end

	def fullname
		self.allocation.episode.client.fullname
	end

  def client
    self.allocation.episode.client
  end

	def practitioner
	  self.allocation.practitioner.fullname
	end

	def appointment_start
		DateTime.parse("#{self.appointment_date} #{self.appointment_time}")
	end

	def appointment_end
		self.appointment_start + 1.hour
	end

	def self.dayactivity(date)
		Clinic.includes(:slot).where("day_of_week = dayofweek(?) - 1", date) # MySQL's day of week is 1-based, Ruby's is 0-based
	end

		#
	# Returns the count of appointments for this allocation prior to the date of the
	# current object
	#
	def sequence
		unless self.id.nil? # a nil ID means a virtual "anticipated" appointment
			#
			# Gets a count of the number of appointments for this allocation prior to this
			# appointment's date
			seq=Appointment.joins(:slot_date).
				where("allocation_id=?", self.allocation_id).
				where("appointment_date<?",self.slot_date.appointment_date).
				where(:counted => true).
				count + 1
      logger.debug "appointment.sequence: non-virtual appointment #{self.id} = #{seq}"
      seq
		else # is a pencilled-in appointment
		
			#
			# Find the last actual appointment in this sequence
			#
			lastappointment = Appointment.where("allocation_id=?", self.allocation_id).last
			#
			# OK, we know when our last appointment for this allocation was. Now let's count the intervening
			# interruptions that might exist between then and now
			#

			# count absences and other appts
			

			# count weeks between last appt and this one
			s = (self.appointment_date - lastappointment.appointment_date).to_i / 7
			s + lastappointment.sequence
		end
	end

	def identifiers
	  a = self.attributes
	  a.extract!("appointment_date", "appointment_time", "allocation_id", "slot_id")
	end

	def div_id
  	"appt#{self.slot_date.appointment_date.mjd}#{self.appointment_time.to_i}"
  end

end
