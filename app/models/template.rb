class Template < ActiveRecord::Base
  belongs_to :account
  attr_accessible :description, :filename, :name
end
