class Practitioner < User
  has_and_belongs_to_many :practitioner_types, { :join_table => "practitioner_types_users", :foreign_key => "user_id" }
  has_many :clinics
  has_many :allocations
  belongs_to :user
  belongs_to :account
  has_and_belongs_to_many :episodes # This association maintains PREFERRED practitioners for this episode
  has_many :print_jobs

  validates :forename, presence: true
  validates :surname, presence: true
  validates :title, presence: true
  validates :email, presence: true

  default_scope joins(:practitioner_types).uniq
  

  def fullname
    [self.forename, self.surname ].join ' '
  end

	def clinicsforday(date)
	  Clinic.where("clinics.day_of_week = dayofweek(?) - 1", date).
      where("practitioner_id=?", self)
	end

	def absent?(date)
		Absence.
			where("? BETWEEN date_from and date_to", date).
			where("practitioner_id=?",self).
			count > 0
	end

  #
  # Returns a list of vacant slots for the practitioner
  #
  def vacant_slots(from, to)

  end
end
