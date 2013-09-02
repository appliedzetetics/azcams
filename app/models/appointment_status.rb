class AppointmentStatus < ActiveRecord::Base
	belongs_to :accounts
	has_many :appointments
	has_and_belongs_to_many :templates
	
	scope :account, lambda { |a| where(:account_id => a) }
end
