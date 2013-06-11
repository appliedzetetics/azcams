class Practitioner < User
  has_and_belongs_to_many :practitioner_types, { :join_table => "practitioner_types_users", :foreign_key => "user_id" }
  has_many :clinics
  has_many :allocations
  belongs_to :user
  has_and_belongs_to_many :episodes

  validates :forename, presence: true
  validates :surname, presence: true
  validates :title, presence: true
  validates :email, presence: true


  scope :account, lambda { |u| where(:account_id => u.account) }
  scope :practitioner, joins(:practitioner_types).group([:surname, :forename])

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
