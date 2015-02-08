require_relative '../spec_helper'
require "faker"
=begin
  describe "functionality" do
    it "function" do
      #actions
    end
  end
=end



describe "user registrations" do
  describe "passing a user name and password" do
    it "user creation produces new users." do
      user_name = Faker::Name.first_name
      password = "doodle"
      user = {name: user_name, password: password}
      expect {
        post "/users/new", {user: user}
        }.to change{User.count}
    end
  end
  describe "validations" do
    it "no name raises a no name flag" do
      password = "doodle"
      user = User.new({ password: password})
      user.save
      expect(user.errors.messages.keys.include?(:name)).to eq(true)
    end
  end

end
