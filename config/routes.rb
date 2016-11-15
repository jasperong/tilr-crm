Rails.application.routes.draw do
  devise_for :users, path: '/', controllers: { omniauth_callbacks: "users/omniauth_callbacks" }


  resources :users, only: [] do
    resources :contacts do
      collection do
        get :favorite
        get :family
        get :friend
        get :colleague
      end
    end
  end
  # devise_for :users, controllers: {
  #       sessions: 'users/sessions'
  #     }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "contacts#index"
end
