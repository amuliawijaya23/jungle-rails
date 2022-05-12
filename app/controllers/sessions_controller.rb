class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email].strip.downcase)
    if user.authenticate_with_credentials(params[:email].strip.downcase, params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end