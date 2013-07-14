get '/' do
 @game = Game.all
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

#----------- GAMES -----------

get "/test" do
erb :board
end


get "/game" do
  new_game = Game.create
  user = current_user
  new_game.player1_id = user.id
  new_game.save!
  redirect "/game/#{new_game.id}"
end
get "/game/:id/symbol" do |id|
  game = Game.find(id)
  puts session[:user]
  puts game.player1_id
  return session[:user] == game.player1_id ? "X" : "O"
end

get "/game/:id" do
 erb :board
end



