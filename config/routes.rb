Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :questions do
        post 'insert', to: 'questions#insert'
        get 'fetch', to: 'questions#show'
      end
      namespace :auth do
        post 'signin', to: 'auth#signin'
        post 'signup', to: 'auth#signup'
      end
    end
  end
end
