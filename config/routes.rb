Rails.application.routes.draw do

devise_for :users

devise_scope :user do
  authenticated :user do
    root 'bucketlists#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end

get '/about' => 'pages#home'

  
  resources :users, only: [:show]
  resources :bucketlists do
    resources :photos
  end

end
