class AllocationType < ActiveRecord::Base
	belongs_to :account
	has_many :allocations
	has_and_belongs_to_many :templates

	validates :description, presence: true
	validates :default_appointment_count, presence: true

end
