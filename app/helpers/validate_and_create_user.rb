def validate_and_create_user
  session[:error] = []
  if params[:user]["password"].length < 6
    session[:error] << "Please ensure your password is at least 6 characters in length."
  else
    params[:user]["password_hash"] = BCrypt::Password.create(params[:user]["password"])
    params[:user].delete("password")
    params[:user]["name"] = params[:user]["name"].capitalize
    user = User.new(params[:user])
    if user.valid?
      session[:email] = user.email
      session[:error] = nil
      user.save
    else
      session[:error] << "You've already created an account with this email address.  Please login!"
    end
  end
end
