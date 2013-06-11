class AbsenceSlot < ActiveRecord::Base
  belongs_to :absence
  attr_accessible :time_from, :time_to

  validates :absence_id, presence: true
  validates :time_from, presence: true
  validates :time_to, presence: true
end
