class UsersController < ApplicationController
  # Не дать залогиненому пользователю перейти на страницу регистрации
  before_action :deny_access_to_authorized, only: %i[new create]
  before_action :authorize, only: %i[profile]

  def new; end

  def profile; end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = 'invalid data'
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
