get "/equations" do
  @user = session_current_user
  @users_equations = @user.equations
  erb :"equations/list"
end

get "/equations/new" do
  @user = session_current_user
  erb :"equations/new"
end

post "/equations/new" do
  @user = session_current_user
  @user.equations.create(params[:eqn])
  redirect("/equations")
  # erb :"equations/new"
end
