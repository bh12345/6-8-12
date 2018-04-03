require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test '003 сессия не должна создаваться для несуществующего пользователя' do
    post '/login', params: { email: 'admin@admin.ru', password: '123' }
    assert session[:user_id].nil?
  end

  test '004 сессия должна создаваться для существующего пользователя' do
    post '/signup', params: { user: { name: 'google',
                                      email: 'google@google.com',
                                      password: 'google',
                                      password_confirmation: 'google' } }
    assert !session[:user_id].nil?
    assert (get '/logout'), :success
    post '/login', params: { email: 'google@google.com', password: 'google' }
    assert !session[:user_id].nil?
  end
end
