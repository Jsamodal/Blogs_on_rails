Rails.application.routes.draw do
  
  get('/', {to: 'welcome#index', as: 'root'})
  post('/users/new', {to: 'users#new'})
  get( '/users/:id', {to: 'users#update'})
  get( '/users', {to: 'users#update'})

  resources :blogs do
    resources :comments, only:[:create, :destroy]
  end 

  resources :users, only:[ :new, :create, :update]
  resource :session, only:[:new, :create, :destroy]
end
