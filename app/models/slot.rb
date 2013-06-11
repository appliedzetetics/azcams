class Slot < ActiveRecord::Base
  belongs_to :clinic
  has_many :appointments

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
		l = self.lastappointmentforslot


    unless l.nil? || l.appointment_date >= date
      #
      # Now we're going to check whether there are later appointments for the same allocation
      # but in a different time slot (well, it happens...)
      #
      m = Appointment.
        joins(:allocation).
        where("allocation_id=?", l.allocation).
        where("appointment_date > ?", l.appointment_date).
        last
      if m.nil? # phew, nope.
        a = l.clone
        a.id = nil
#        startcount = l.sequence
        a.appointment_date = date
        a.appointment_time = self.start_time
        a.slot = self
        a
      end
    end
	end

	def appointments(date)
		Appointment.
			joins(:allocation).
			where("appointment_date = ?", date).
			where("practitioner_id = ?", self.clinic.practitioner_id).
			where(:appointment_time=>(self.start_time..self.start_time + 59.minutes)).
			order("appointment_time")
	end

	def appointments?(date)
		self.appointments(date).count > 0
	end


	def lastappointmentforslot
		Appointment.
      joins(:allocation).
			where("practitioner_id=?", self.clinic.practitioner_id).
			where(:appointment_time=>(self.start_time..self.start_time + 59.minutes)).
			last
	end

	def available?(date)
	  !self.appointments?(date) && self.anticipated_appointment(date).nil?
	end
end
