Rails.application.routes.draw do
  # Вход
  get    '/login'     => 'sessions#new'
  post   '/login'     => 'sessions#create'
  # Выход
  get    '/logout'    => 'sessions#destroy'
  # Регистрация
  get    '/signup'    => 'users#new'
  post   '/signup'    => 'users#create'
  # Профиль
  get    '/profile'   => 'users#profile'
  get    'users/profile'


  # Показ последних постов
  get    '/new' => 'posts#last'
  get    '/posts/show'
  # Создание поста
  get    '/posts/new'
  post   '/posts'     => 'posts#create'
  post   '/comments'  => 'comments#create'
  # Удаление поста
  get    'posts/remove'


  root   'posts#last'
end
