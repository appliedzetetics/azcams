class Idea < ActiveRecord::Base
  belongs_to :user
  attr_accessible :notes, :url
end
