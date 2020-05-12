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
          if command.success?
            render json: { success: true }
          else
            render json: { error: command.errors }, status: :ok
          end
        end
      end
    end
  end
end
