Rails.application.routes.draw do
  get 'static_pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static_pages#index"

  namespace 'api' do
    namespace 'v1' do
      resources :recipes, only: [:index, :create, :show, :update, :destroy]
      resources :users, only: [:create]
      post "/login", to: "users#login"
      get "/auto_login", to: "users#auto_login"
      get "/recipes/user/:id", to: "recipes#recipes_user"
    end
  end

end
