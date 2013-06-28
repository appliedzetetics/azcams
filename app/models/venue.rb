class Venue < ActiveRecord::Base
  has_many :clinics
  has_many :appointments
  belongs_to :account
  
#  scope :account, lambda { |a| where(:account_id => a) }
  
end
