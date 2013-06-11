class MessageType < ActiveRecord::Base
  attr_accessible :description, :is_email, :is_phone, :is_printable
end
