class Absence < ActiveRecord::Base
  belongs_to :practitioner
  attr_accessible :date_from, :date_to

  validates :practitioner_id, presence: true
  validates :date_from, presence: true
  validates :date_to, presence: true

end
