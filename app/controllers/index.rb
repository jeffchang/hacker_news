get '/' do
  @users = User.all
  @email = session[:email]
  @error = session[:error]
  session[:error] = nil
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  @email = session[:email]
  @error = nil
  erb :sign_in
end

post '/sessions' do
  confirm_login
  redirect '/'
end

delete '/sessions/:id' do
  session.clear
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  validate_and_create_user
  redirect '/'
end

#---------- PROFILE ------------

get '/profile' do
  @user = User.find_by_email(session[:email]) rescue nil
  @user ? (erb :profile) : (redirect '/')
end

get '/my_submissions' do
  @user = User.find_by_email(session[:email]) rescue nil
  @posts = Post.where(user_id: @user.id)
  @user ? (erb :my_submissions) : (redirect '/')
end

get '/my_comments' do
  @user = User.find_by_email(session[:email]) rescue nil
  @comments = Comment.where(user_id: @user.id)
  @user ? (erb :my_comments) : (redirect '/')
end
