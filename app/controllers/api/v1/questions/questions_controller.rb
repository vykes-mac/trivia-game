module Api
  module V1
    module Questions
      class QuestionsController < ApplicationController
        def insert
          command = InsertQuestion.call(params[:question],
                                        params[:answer],
                                        params[:choices],
                                        params[:categories],
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
