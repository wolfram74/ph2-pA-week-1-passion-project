class Sheet < ActiveRecord::Base
  has_many :listings
  has_many :equations, through: :listings
  belongs_to :user
  # Remember to create a migration!
end
