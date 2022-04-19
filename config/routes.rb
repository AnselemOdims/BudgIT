Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    devise_scope :user do
      authenticated :user do
        root :to => "categories#index", as: :authenticated_root
        get '/users/sign_out' => 'devise/sessions#destroy'
      end
      unauthenticated :user do
        root :to => "splashs#index", as: :unauthenticated_root
      end
    end

    resources :categories do
      resources :deals
    end
end
