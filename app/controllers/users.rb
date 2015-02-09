get "/users/new" do
  p params[:user]
  @user = User.new()
  erb :"users/new"
end

post "/users/new" do
  info = params[:user]
  if info["password"] == info["password_confirmation"]
    info.delete("password_confirmation")
    @user = User.new(info)
  else
    redirect ("/users/new")
  end
  if @user.save
    session_set_current_user @user
    redirect ("/")
  else
    erb :'users/new'
  end
end