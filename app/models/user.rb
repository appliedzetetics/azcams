class User < ActiveRecord::Base
  has_and_belongs_to_many :practitioner_types
  has_many :clinics
  has_many :allocations
  belongs_to :account

  accepts_nested_attributes_for :clinics

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :surname, :forename, :title, :admin

  scope :account, lambda { |u| where(:account_id => u.account) }

  def fullname
    [self.forename, self.surname].join " "
  end

  def initials
    [self.forename[0,1], self.surname[0,1]].join ''
  end

end
