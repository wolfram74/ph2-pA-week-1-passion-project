require 'bcrypt'

class User < ActiveRecord::Base
  has_many :urls
  include BCrypt

  validates :name, presence: true
  # validates :password, presence: true, length: {mininum: 6}

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    # raise "Stuff borked"
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
