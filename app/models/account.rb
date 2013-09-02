class Account < ActiveRecord::Base
  attr_accessible :bgcolor, :logo, :name
  belongs_to :user
  has_many :venues
  has_many :users
  has_many :practitioners
#  has_many :settings, :through => :accounts_settings
  has_many :clients
  has_many :templates
  has_many :allocation_types
	has_many :appointment_statuses
  has_many :clinics, :through => :practitioners

  def adminuser
    self.user.fullname
  end
end
