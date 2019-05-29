Rails.application.routes.draw do

  devise_for :users, :controllers => {registrations: 'registrations'}

    resources :tweets do
      resources :comments
    member do
            put 'like', to: "tweets#like"
            put 'unlike', to: "tweets#unlike"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'
end