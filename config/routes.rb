Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :projects, only: [:index, :show]
      get "/users/:username", to: "users#show"
    end
  end
  mount Ckeditor::Engine => '/ckeditor'
  get '/admin', to: 'admin/dashboard#index'

  namespace :admin do
    resources :posts
    resources :dashboard, only: [:index] do
      collection do
        get "statistics"
      end
    end
    resources :comments
    resources :projects
    resources :admins, except: [:new, :create]
  end

  resources :posts, only: [:index, :show] 
  resources :posts do
    resources :comments, only: [:create]
  end
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'

  # GitHub authentication routes
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'posts#index'
end

