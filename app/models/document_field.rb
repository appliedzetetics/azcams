class DocumentField < ActiveRecord::Base
  has_and_belongs_to_many :templates
  attr_accessible :documentfield, :railsvariable


	#
	# The class name in the table refers to the base class from which the railsvariable
	# chain stretches.
	#
	def self.by_base_class(b)
		where(:class_name => c)

end
