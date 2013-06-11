class Client < ActiveRecord::Base
	has_many :episodes

  scope :account, lambda { |u| where(:account_id => u.account) }

  #	a scope to pull all clients with episodes and allocations
	scope :openallocations, lambda {
		includes(
			:episodes => [
				{:allocations => :appointments}, :allocation_types
			]
		).where("episodes.id IS NOT NULL").
		where("(allocation_types.is_assessment > 0 AND appointments.id IS NOT NULL) OR (allocation_types.is_treatment > 0 AND appointments.id IS NULL)")
	}

	# client is on the IA waiting list if:
	# * there's an open episode;
	# * there's an allocation record and NO appointment
	# * OR there's no allocation record
	#
	# The date they went on the waiting list is the referral date.
	scope :on_ia_wl,
		includes(:episodes=>{:allocations=>[:appointments,:allocation_type]}).
		where("episodes.closed=0").
		where("(allocation_types.is_assessment > 0 AND appointments.id IS NULL) OR (allocation_type_id IS NULL)").
		order("greatest(coalesce(referral_date, '0000-00-00'), coalesce(appointment_date, '0000-00-00'))")

	# Client is on the therapy waiting list if:
	# * there's an open episode
	# *   there's an IA allocation record
	# *   WITH an appointment whose outcome is 'Counselling'
	# * OR
	# *   there's a "Counselling" allocation record and NO appointment
	#
	# The date they went on the waiting list is the date of the IA appointment
	scope :on_therapy_wl,
		includes(:episodes=>{:allocations=>[:appointments,:allocation_type]}).
			where("episodes.id IS NOT NULL").
			where("episodes.closed=0").
			where("appointments.appointment_date < NOW()").
			where("(allocation_types.is_assessment > 0 AND appointments.id is not null) OR (allocation_types.is_treatment > 0 AND appointments.id IS NULL)").
			order("greatest(coalesce(allocations.created_at, '0000-00-00'), coalesce(appointment_date, '0000-00-00'))")

  # Derived fields from client table
  #

	def fullname
	  "#{forename} #{surname}"
	end

	def fullname_and_dob
		"#{forename} #{surname} #{dob}"
	end

  #
  # Derived fields from other tables
  #

	def latestepisode
		self.episodes.last
	end

	def waitstartdate
		latestepisode.nil? || latestepisode.waitstartdate
	end

	def waitingliststatus
		latestepisode.nil? || latestepisode.waitingliststatus
	end

	def has_openreferral?
		!latestepisode.nil? && !latestepisode.closed?
	end

	def is_allocated?
		if (has_openreferral?)
			# Has it been allocated
			!latestepisode.allocations.last.nil?
		else
      false
    end
	end

	def status
		if !has_openreferral?
			"Dormant"
		else
			latestepisode.waitingliststatus
		end
	end

	def current_file_no
    latestepisode.file_no if episodes.count > 0
	end
end
