module Questions
  class GetCategories
    prepend SimpleCommand
    include Questions

    def call
      @ques = categories
    end

    private

    def categories
      Question.distinct(:categories)
    end
  end
end
