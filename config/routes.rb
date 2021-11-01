Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  scope '/:locale' do

    root to: 'home#index'
    get '/gallery', to: 'home#gallery'
    get '/info', to: 'home#info'

    get  '/account', to: 'account#edit'
    post '/account', to: 'account#update'

    get 'login', to: 'sessions#new'
    get 'signup', to: 'users#new'
    get 'logout', to:'sessions#destroy'

    get 'forum', to:'posts#index'

    namespace :account do
      resources :posts, only: [:index]
      resources :dogs, only: [:new, :edit]
    end

    resources :posts do
      resources :comments, only: [:create, :destroy]
    end

    resources :sessions, only: [:new, :create, :destroy]

    resources :users 

    resources :trainers, only: [:index, :show] 

    resources :dogs, only: [:create, :update]

    resources :blog, as: :blogposts

    get 'chat/index'

    resources :conversations, only: [:create] do
      member do
        post :close
      end
      # resources :messages, only: [:create]
    end

  end

end
