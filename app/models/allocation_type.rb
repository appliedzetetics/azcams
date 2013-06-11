class AllocationType < ActiveRecord::Base
	has_many :allocations

	validates :description, presence: true
	validates :default_appointment_count, presence: true

end
