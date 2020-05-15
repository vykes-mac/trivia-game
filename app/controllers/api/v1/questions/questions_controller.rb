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
          handle_command(:success, command)
        end

        def show
          command = FetchQuestions.call(params[:categories])
          handle_command(:questions, command)
        end

        def answer
          command = AnswerQuestion.call(params[:id], params[:answer])
          handle_command(:answer, command)
        end

        def categories
          command = GetCategories.call
          handle_command(:categories, command)
        end
      end
    end
  end
end
