get "/equations" do
  @user = session_current_user
  erb :"equations/list"
end

get "/equations/new" do
  @user = session_current_user
  erb :"equations/list"
end