require_relative '../spec_helper'
require "faker"
=begin
  describe "functionality" do
    it "function" do
      #actions
    end
  end
=end

# before(:each) do
#   User.destroy_all
#   Equation.destroy_all
#   Sheet.destroy_all
#   Listing.destroy_all
# end

describe "equation model" do
  it "model permits creation" do
    expect {Equation.create({latex_string:"3^2+4^2 = 5^2", label:"smallest triple", description: "The smallest triple satisfying the pythagorean theorem." ,  private: "" })}.to change{Equation.count}
  end
end

describe "sheet model" do
  it "model permits creation" do
    expect {Sheet.create({name:"trig", description: "basic trig equations"})}.to change{Sheet.count}
  end

  it "model can have equations added" do
    new_sheet = Sheet.create({name:"trig", description: "basic trig equations"})
    new_equation = Equation.create({latex_string:"3^2+4^2 = 5^2", label:"smallest triple", description: "The smallest triple satisfying the pythagorean theorem." ,  private: "" })
    expect {new_sheet.equations << new_equation}.to change{new_sheet.equations.length}
  end

end

describe "user model" do
  it "model permits creation" do
    expect {User.create({name: "pythag", password: "beanhater"})}.to change{User.count}
  end

  it "user can create sheets" do
    pyth = User.create({name: "pythag", password: "beanhater"})
    expect {pyth.sheets.create({name:"trig", description: "basic trig equations"})}.to change{pyth.sheets.count}
  end

  it "user can create equations" do
    pyth = User.create({name: "pythag", password: "beanhater"})
    expect {pyth.equations.create({latex_string:"3^2+4^2 = 5^2", label:"smallest triple", description: "The smallest triple satisfying the pythagorean theorem." ,  private: "" })}.to change{pyth.equations.count}
  end

  it "equations can be removed from single lists" do
    pyth = User.create({name: "pythag", password: "beanhater"})
    expect {pyth.equations.create({latex_string:"3^2+4^2 = 5^2", label:"smallest triple", description: "The smallest triple satisfying the pythagorean theorem." ,  private: "" })}.to change{pyth.equations.count}
  end


end
