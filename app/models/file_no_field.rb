class FileNoField < ActiveRecord::Base
  belongs_to :type
  attr_accessible :column, :table
end
