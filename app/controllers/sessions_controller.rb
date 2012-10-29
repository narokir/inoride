class SessionsController < ApplicationController
  def new

  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      #redirect_to root_url, notice: "Logged in!"
    else
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to user
      #flash.now.alert = "Email or password is invalid"
      #render "new"
    end

    #user = User.from_omniauth(env["omniauth.auth"])
    #session[:user_id] = user.id
    #redirect_to user
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end

