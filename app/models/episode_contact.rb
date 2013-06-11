class EpisodeContact < ActiveRecord::Base
  belongs_to :episode
  belongs_to :contact_type
  belongs_to :contact_action
  belongs_to :user
  attr_accessible :contacted, :from_client, :notes
end
