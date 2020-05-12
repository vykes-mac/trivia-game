module Questions
  class AnswerQuestion
    prepend SimpleCommand
    include Questions

    def initialize(id, answer)
      @question_id = id
      @answer = answer
    end

    def call
      create_dto(answer_question)
    end

    private

    attr_accessor :question_id, :answer

    def answer_question
      ques = Question.find(question_id)
      return errors.add :not_found, 'question not found' if ques.nil?

      ques
    end

    def create_dto(doc)
      scoring = if doc.answer == answer
                  Rails.configuration.scoring[:increase]
                else
                  Rails.configuration.scoring[:decrease]
                end

      dto = { user_answer: answer,
              correct_answer: doc.answer,
              is_correct: doc.answer == answer,
              change_score_by: scoring }

      dto
    end
  end
end
