Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    devise_scope :user do
      authenticated :user do
        root :to => "foods#index", as: :authenticated_root
        get '/users/sign_out' => 'devise/sessions#destroy'
      end
      unauthenticated :user do
        root :to => "devise/sessions#new", as: :unauthenticated_root
      end
    end
    get '/splash' => 'splashs#index'
end
