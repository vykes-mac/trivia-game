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
        get 'categories', to: 'questions#categories'
      end

      namespace :scores do
        post 'add', to: 'scores#add'
        get  'highscores', to: 'scores#highscores'
        get  'user', to: 'scores#user'
        get  'user/best_category', to: 'scores#best_category'
      end
    end
  end
end
