Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :questions
      namespace :auth do
        post 'signin', to: 'auth#signin'
      end
    end
  end
end
