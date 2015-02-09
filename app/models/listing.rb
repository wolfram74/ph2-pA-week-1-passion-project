class Listing < ActiveRecord::Base
  belongs_to :sheet
  belongs_to :equation
  # Remember to create a migration!
end
