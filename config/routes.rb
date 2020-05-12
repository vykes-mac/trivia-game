Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :auth do
        post 'signin', to: 'auth#signin'
        post 'signup', to: 'auth#signup'
      end

      namespace :questions do
        post 'insert', to: 'questions#insert'
        get 'fetch', to: 'questions#show'
        get 'answer', to: 'questions#answer'
      end

      namespace :scores do
        post 'add', to: 'scores#add'
        get  'highscores', to: 'scores#highscores'
        get  'user', to: 'scores#user'
      end
    end
  end
end
