require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test '004 можем создать пост если прошли аутентификацию' do
    post '/signup', params: { user: { name: 'google',
                                      email: 'google@google.com',
                                      password: 'google',
                                      password_confirmation: 'google' } }

    assert_redirected_to '/'
    assert (get '/new'), :success
    post '/posts', params: { post: {  title: 'Заголовок тестового поста',
                                      content: 'Наполнение тестового поста',
                                      tags: 'Теги тестового поста' } }
    assert Post.find_by_title('Заголовок тестового поста')
  end

  test '005 можем смотреть конкретный пост если прошли аутентификацию' do
    post '/signup', params: { user: { name: 'google',
                                      email: 'google@google.com',
                                      password: 'google',
                                      password_confirmation: 'google' } }

    assert_redirected_to '/'
    assert (get '/posts/show?id=298486374'), :success # id поста в тестовой БД
  end

  test '006 можем смотреть новые посты если прошли аутентификацию' do
    post '/signup', params: { user: { name: 'google',
                                      email: 'google@google.com',
                                      password: 'google',
                                      password_confirmation: 'google' } }

    assert_redirected_to '/'
    assert (get '/posts/new'), :success
  end
end
