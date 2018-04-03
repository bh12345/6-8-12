Rails.application.routes.draw do
    
  get 'lr8c/input'

  get 'lr8c/view'
  root 'lr8#input'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
