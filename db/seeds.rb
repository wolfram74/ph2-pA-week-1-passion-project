#{name: "pythag", password: "beanhater"}
#{name:, description: }
#{latex_string:, label;, description: , private: }
User.destroy_all
Equation.destroy_all
Sheet.destroy_all
Listing.destroy_all


user = {name: "pythag", password: "beanhater"}
eqn1 = {latex_string:"3^2+4^2 = 5^2", label:"smallest triple", description: "The smallest triple satisfying the pythagorean theorem." ,  private: "" }
eqn2 = {latex_string:"18^2+24^2 = 30^2", label:"large triple", description: "The large triple satisfying the pythagorean theorem less than 1000." ,  private: ""}
eqn3 = {latex_string:"a^w*sh_it=f(c,k)Y_e^a", label:"general solution", description: "Complete solution to all problems." ,  private: "true" }

sheet_1 = {name:"trig", description: "basic trig equations"}

sheet_2 = {name:"secrets", description:"don't tell nobody." }

pyth = User.create(user)
pyth.equations.create(eqn1)
pyth.equations.create(eqn2)
pyth.equations.create(eqn3)
pyth.sheets.create(sheet_1)
pyth.sheets.create(sheet_2)
pyth.sheets[0].equations << pyth.equations[0]
pyth.sheets[0].equations << pyth.equations[1]
pyth.sheets[1].equations << pyth.equations[1]
pyth.sheets[1].equations << pyth.equations[2]
