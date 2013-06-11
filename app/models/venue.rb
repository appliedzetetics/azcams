class Venue < ActiveRecord::Base
  has_many :clinics
  has_many :appointments
  
  scope :account, lambda { |u| where(:account_id => u.account) }
  
end
