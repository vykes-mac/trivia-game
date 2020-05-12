module Api
  module V1
    module Scores
      class ScoresController < ApplicationController
        def add
          command = AddScore.call(params[:score],
                                  params[:correct_streak],
                                  params[:incorrect_streak],
                                  params[:best_category],
                                  current_user)
          handle_command(:success, command)
        end
      end
    end
  end
end
