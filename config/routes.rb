Rails.application.routes.draw do
  
  get('/', {to: 'welcome#index', as: 'root'})
  post('/users/new', {to: 'users#new'})

  resources :blogs do
    resources :comments, only:[:create, :destroy]
  end 

  resources :users, only:[ :new, :create]
  resource :session, only:[:new, :create, :destroy]
end
