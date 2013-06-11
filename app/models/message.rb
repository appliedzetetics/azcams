class Message < ActiveRecord::Base
  belongs_to :episode
  belongs_to :template
  belongs_to :message_type
  belongs_to :user
  attr_accessible :completed
  
  scope :byuser, lambda {|u| where(:user_id => u) }
  scope :recent, lambda {|c| where("completed IS NULL or created_at > ?", 4.days.ago) }
end
