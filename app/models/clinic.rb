class Clinic < ActiveRecord::Base
  belongs_to :practitioner
  belongs_to :venue
  has_many :slots

  accepts_nested_attributes_for :slots, :allow_destroy => true
#    :reject_if     => lambda { |s| s[:start_time].blank? }

  scope :account, lambda { |u| joins(:practitioner).where("users.account_id=?", u.account) }

  validates :venue_id, :practitioner_id, :day_of_week, :presence => true

  accepts_nested_attributes_for :slots

  DAYS = { 0 => "Monday", 1 => "Tuesday", 2 => "Wednesday", 3 => "Thursday", 4 => "Friday", 5 => "Saturday", 6 => "Sunday" }

  def dayname
    DAYS[self.day_of_week]
  end

  def slotsfordate(date)
	  Slot.joins("left outer join appointments on (slots.id = appointments.slot_id)").where("clinic_id = ?", self).
			where("appointments.id IS NULL OR (appointments.appointment_date = ?)", date).
			order(["start_time"])
	end


end
