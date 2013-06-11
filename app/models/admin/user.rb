class Admin::User < ActiveRecord::Base
  attr_accessible :admin, :email, :forename, :surname, :title
end
