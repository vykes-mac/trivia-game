module Questions
  class GetCategories
    prepend SimpleCommand
    include Questions

    def call
      @ques = insert_question
    end

    private

    def categories
      Question.distinct(:categories)
    end
  end
end
