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
    it "function" do
      user_name = Faker::Name.first_name
      password = "doodle"
      user = {name: user_name, password: password}
      expect {
        post "/users/new", {user: user}
        }.to change{User.count}
    end
  end

end
