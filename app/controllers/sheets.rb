get "/sheets/list" do
  @user = session_current_user
  @user_sheets = @user.sheets
  erb :"sheets/list"
end

get "/sheets/new" do
  @user = session_current_user
  @all_equations = Equation.all
  @users_equations = @user.equations
  @private_equations = Equation.where(private: "true")
  @public_equations = @all_equations-(@users_equations+@private_equations)
  erb :"sheets/new"
end

post "/sheets/new" do
  form_data = params[:sheet]
  @user = session_current_user
  sheet_info = {name: form_data[:name],
    description: form_data[:description]}
  new_sheet = @user.sheets.create(sheet_info)
  form_data.delete(:name)
  form_data.delete(:description)
  form_data.keys.each do |k|
    equation = Equation.find(k) if Equation.where(id: k).any?
    new_sheet.equations << equation if form_data[k] == "add"
  end
  redirect("/sheets/list")
end

get "/sheets/:id" do |list_id|
  @user = session_current_user
  @sheet = Sheet.find(list_id)
  erb :"sheets/view"
end

get "/sheets/:id/edit" do
  @user = session_current_user
  @all_equations = Equation.all
  @users_equations = @user.equations
  @private_equations = Equation.where(private: "true")
  @public_equations = @all_equations-(@users_equations+@private_equations)
  p "things are happening"*10
  p @users_equations
  p @public_equations
  erb :"sheets/edit"
end

get "/sheets/:id/format" do
  @user = session_current_user
  @all_equations = Equation.all
  erb :"sheets/format"
end

