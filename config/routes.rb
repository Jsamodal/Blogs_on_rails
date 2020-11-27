Rails.application.routes.draw do
  
  get('/', {to: 'welcome#index', as: 'root'})

  resources :blogs do
    resources :comments, only:[:create, :destroy]
  end 
end
