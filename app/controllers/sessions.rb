get '/session/new' do
  @user = User.new
  erb :'/session/new'
end
post '/session/new' do
  @info = params[:user]
  if session_authenticate(@info[:name], @info[:password])
    redirect("/")
  else
    redirect('/session/new')
  end

end

get '/session/logout' do
  session_logout
  redirect("/")
end
