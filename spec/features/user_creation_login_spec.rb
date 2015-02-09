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
      user = {name: user_name, password: password, password_confirmation: password}
      # p user
      expect {
        post "/users/new", {user: user}
        }.to change{User.count}
    end
  end

  describe "password confirmation" do
    it "user creation fails if password confirmation fails." do
      user_name = Faker::Name.first_name
      password = "doodle"
      user = {name: user_name, password: password, password_confirmation: password+"."}
      expect {
        post "/users/new", {user: user}
        }.to_not change{User.count}
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

describe "equation creation" do
  describe "creation behaves well" do
    it "adds a new equation after post" do
      faff = "foofoofoo"

      equation = {latex_string: faff,
        label: faff,
        description: faff,
        private: ""}
      # p user
      temp_id = User.last.id
      expect {
        post "/equations/new", {eqn: equation},{"rack.session" => {:current_user_id => temp_id }}
        }.to change{Equation.count}
    end
  end

end