get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])

  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  if @user == current_user
    erb :'/users/show'
  else
    @errors = ["You are not logged in as this user."]
    erb :'/sessions/new'
  end
end

post '/users/:user_id/movies/:movie_id' do
  @user = User.find(params[:user_id])
  @movie = Movie.find(params[:movie_id])

  favorite = Favorite.create(user_id: params[:user_id], movie_id: params[:movie_id])
  redirect "/users/#{params[:user_id]}"
end
