# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  
  before_action :deny_access_to_authorized, only: %i[new create]

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = 'invalid data'
    
      flash[:email] = params[:email]
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
