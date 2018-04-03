Rails.application.routes.draw do
    get 'auth/autorization'

    resources :users
    resources :auth

    post 'auth/create'
    post 'users/edit'

    get 'signup', to: 'users#newuser', as: 'signup'
    get 'signin', to: 'auth#authorization', as: 'signin'
    get 'signout', to: 'auth#destroy', as: 'signout'

    root to: 'lr#index'

    post 'users/create'
    post 'lr/view'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
