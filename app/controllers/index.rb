get '/' do
  @users = User.all
  @email = session[:email]
  @error = session[:error]
  session[:error] = nil
  @all_posts = Post.all
  erb :index
end

get '/:post_id' do
  @selected_post = Post.find(:post_id]
  @post_comments = @selected_post.comments
  erb :post
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
