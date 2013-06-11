class Allocation < ActiveRecord::Base
  belongs_to :episode
  belongs_to :practitioner
  belongs_to :allocation_type
  has_many :appointments

  validates :allocation_type_id, presence: true

  accepts_nested_attributes_for :appointments,
		:reject_if => lambda { |a| ( a[:appointment_date].to_i == 0) }


  def lastappointment
    self.appointments.last
  end

  def description
		self.allocation_type.description
  end

	def is_assessment?
		allocation_type.is_assessment
	end

	def is_treatment?
		allocation_type.is_treatment
	end


end
