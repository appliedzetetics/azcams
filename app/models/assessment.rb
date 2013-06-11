class Assessment < ActiveRecord::Base
  belongs_to :episode
  belongs_to :practitioner
end
