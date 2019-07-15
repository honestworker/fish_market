require 'api_constraint'

Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/ do
    devise_for :admin, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  # devise_for :admins
  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions"}
  post 'verifications' => 'verifications#create'

  
  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/ do
    scope :module => "frontend" do
      get "about" => "abouts#show", :id => '1'
      resources :products, only: [:index, :show]
      resources :order_items, only: [:create, :update, :destroy]
      resources :orders, only: [:index, :show, :create]
      resources :blogs
      resources :users
      resource :cart, only: [:show,:destroy] do
        collection do
          post :checkout_order
          get :complete_order
          get :order_status
          post :order_status
        end
      end
      # resources :orders, only: [:index, :show, :create]
      get 'meet' => 'abouts#meet'
      get 'faq' => 'abouts#faq'
      root to: "home#index"
      get 'other_services', to: 'home#other_services'
    end
  end

  resources :categories


  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/ do
    namespace :api, defaults: {format: 'json'} do
      namespace :v1, constraint: ApiConstraint.new(version: 1, default: true) do
        get 'meter', to: 'meter#percentage'
        get 'cities', to: 'cities#index'
        resources :users, :only => [:show, :create, :update, :destroy] do
          collection do
            get :create_guest
          end
        end
        resources :admins
        resources :products, only: [:index, :show] do
          collection do
            get :promotions
            get :services
          end
        end
        resources :categories, only: [:index]
        resources :sliders, only: [:index]
        resources :sessions, only: [:create, :destroy]
        resources :orders do
          member do
            put :update_order_items
          end
          collection do
            get :last_incomplete_order
          end
        end
        resources :order_items, only: [:create, :update, :destroy] do
          collection do
            post :create_or_update
          end
        end
        resources :carts, only: [:show]
        get 'home' => 'home#index'
        post 'verifications' => 'verifications#verify', as: :verify
        post 'users/signup' => 'users#create'
        post 'users/signin' => 'sessions#create'
      end
      namespace :v2, constraint: ApiConstraint.new(version: 2) do
        resources :products, only: :index
      end
    end
  end
end
