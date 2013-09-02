class Slot < ActiveRecord::Base
  belongs_to :clinic
	has_many :slot_dates

  validates :clinic_id, :start_time, :presence => true

  def hours
    @start_time.hour if @start_time
  end

  def minutes
    @start_time.min if @start_time
  end

  def hours=(h)
    @hours = h
    setstarttime
  end

  def minutes=(m)
   @minutes = m
   setstarttime
  end

  def setstarttime
    self.start_time = Time.utc(1,1,1,@hours, @minutes,0,0)
  end

	def anticipated_appointment(date)
		#
		# Easy, this. We pull up the latest appointment for this slot, then walk forward
		# seeing if it falls within the scope of the therapy (6 by default)
		# If it does, we return it as an appointment, otherwise we return nil
		l = self.lastappointmentforslot(date)

		#
		# if there are no previous appointments for this client/slot, or the latest appointment
		# is in the future, don't bother anticipating, otherwise let's pencil them in.
		#
    unless l.nil? || l.appointment_date >= date

      #
      # Count how many have already been had
      #
      appointmentcount = Appointment.where(:allocation_id => l.allocation).where(:counted => 1).count

      #
      # Now we're going to check whether there are later appointments for the same allocation
      # but in a different time slot (well, it happens...)
      #
      
      # NOT IMPLEMENTED (YET)

      #m = Appointment.
      #  j
      #  joins(:allocation).
      #  where("allocation_id=?", l.allocation).
      #  where("appointment_date > ?", l.appointment_date).
      #  last
      #if m.nil? # phew, nope.
      #  a = l.clone
      #  a.id = nil
#     #   startcount = l.sequence
      #  a.appointment_date = date
      #  a.appointment_time = self.start_time
      #  a.slot = self
      #  a
      #end
      
      #
      # Count the weeks since the last appointment
      #
      weeks = (date - l.appointment_date)/7
      
      #
      # Count absences (TO BE IMPLEMENTED)
      #
      
    	if (appointmentcount + weeks <= l.allocation.appointment_count)
    		a=l.clone
    		a.id=nil
    	else
    		a=nil
    	end
    	
    	a
		      
     
    end
	end

	def appointments(date)
		
#		Appointment.
#			joins(:allocation).
#			where("appointment_date = ?", date).
#			where("practitioner_id = ?", self.clinic.practitioner_id).
#			where(:appointment_time=>(self.start_time..self.start_time + 59.minutes)).
#			order("appointment_time")
	end

	def appointments?(date)
		self.appointments(date).count > 0
	end

	
	def lastappointmentforslot(day)
		#
		# find most recent appointment for this slot before date
		#
		slot_date=self.slot_dates.last
		
		#
		# See which allocation it was for
		#
		allocation=nil
		a = slot_date.try(:appointments)
		unless a.nil?
			allocation = a.last.try(:allocation)
		end

		unless allocation.nil?
		
			#
			# And find the latest appointment for that allocation
			#
			Appointment.joins(:slot_date).where(:allocation_id => allocation).order(:appointment_date).last
		else
			nil
		end
	end

	def available?(date)
	  !self.appointments?(date) && self.anticipated_appointment(date).nil?
	end
	
		def div_id
  	"slot#{self.id}"
  end

end
