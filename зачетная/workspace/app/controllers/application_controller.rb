class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  def set_locale
    session[:locale] = params[:locale] if params[:locale]
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue
    # На случай утери id пользователя из базы данных
    redirect_to '/logout'
  end

  helper_method :current_user

  # Если пользователь не зайден
  def authorize
    redirect_to '/login' unless current_user
  end

  # Если пользователь залогинен, то нужно не дать перейти на некоторые страницы
  def deny_access_to_authorized
    redirect_to '/' if current_user
  end
  # нельзя объединять предыдущие 2 метода
end
