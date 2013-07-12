get '/' do
 @users = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  user = User.find_by_email(params[:email])
  if user && user.password == params[:password]
    session[:user] = user.id
    redirect '/'
  else
    @error = "Invalid Email/Password combination"
    erb :sign_in
  end
end

delete '/sessions/:id' do
  session.clear
  200
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  @user = User.new(params[:user])
  @user.password = params[:user][:password]
  if @user.valid?
    @user.save
    session[:user] = @user.id
    redirect '/'
  else
    @error = @user.errors
    erb :sign_up
  end
end
