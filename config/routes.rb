Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :questions
      resources :item
      namespace :auth do
        post 'signin', to: 'auth#signin'
        post 'signup', to: 'auth#signup'
      end
    end
  end
end
