module Questions
  class InsertQuestion
    prepend SimpleCommand
    include Questions

    def initialize(question, answer, choices, categories, user)
      @question = question
      @answer = answer
      @choices = choices
      @categories = categories
      @user = user
    end

    def call
      @ques = insert_question
    end

    private

    attr_accessor :question, :answer, :choices, :categories, :user

    def insert_question
      ques = Question.new(question: question, answer: answer,
                          choices: choices, categories: categories,
                          created_by: user.id)
      errors.add :question_error, ques.errors unless ques.save!
    end
  end
end
