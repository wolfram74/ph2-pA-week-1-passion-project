get "/sheets/list" do
  @user = session_current_user
  erb :"sheets/list"
end

get "/sheets/edit" do
  @user = session_current_user
  erb :"sheets/list"
end

get "/sheets/new" do
  @user = session_current_user
  erb :"sheets/list"
end

get "/sheets/:id" do |list_id|
  @user = session_current_user
  erb :"sheets/view"
end