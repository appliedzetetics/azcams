class AppointmentStatus < ActiveRecord::Base
	has_many :appointments

	scope :account, lambda { |a| where(:account_id => a) }
end
