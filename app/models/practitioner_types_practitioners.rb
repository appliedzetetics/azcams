class PractitionerTypesPractitioners < ActiveRecord::Base
  belongs_to :practitioner_types
  belongs_to :practitioners
end
