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

  get "/contacts/:provider/callback" => "contacts#import_contacts"
  root to: "contacts#index"
end
