class Equation < ActiveRecord::Base
  has_many :listings
  has_many :sheets, through: :listings
  belongs_to :user
  # Remember to create a migration!
end
