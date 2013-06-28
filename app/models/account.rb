class Account < ActiveRecord::Base
  attr_accessible :bgcolor, :logo, :name
  belongs_to :user
  has_many :venues
  has_many :users
  has_many :practitioners
  has_many :settings, :through => :accounts_settings


  def adminuser
    self.user.fullname
  end
end
