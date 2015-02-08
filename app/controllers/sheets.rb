get "/" do
  @user = session_current_user
  erb :index
end