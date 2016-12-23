get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:email])

  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Invalid user/password combination"]
    erb :"/sessions/new"
  end
end

get '/sessions/delete' do
  session.clear
  redirect '/'
end
