class SessionsController < ApplicationController
  def create
  	user = User.from_omniauth(env["omniauth.auth"])
    if sign_in(user)
      redirect_to edit_user_path(user)
    else
      redirect_to sign_in_path
    end


  end

  def destroy
  	session[:user_id] = nil
    redirect_to root_path
  end
end
