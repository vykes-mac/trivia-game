module Questions
  class FetchQuestions
    prepend SimpleCommand
    include Questions

    def initialize(categories)
      @categories = categories
    end

    def call
      create_dto(insert_question)
    end

    private

    attr_accessor :categories

    def insert_question
      return Question.all if categories.empty?

      ques = Question.where(:categories.in => categories)
      return errors.add :not_found, 'document not found' if ques.nil?

      ques
    end

    def create_dto(doc)
      dto = []
      doc.each do |q|
        @dto = { _id: q.id, categories: q.categories,
                 choices: q.choices, created_by: q.created_by,
                 question: q.question }
        dto.push(@dto)
      end
      dto
    end
  end
end
