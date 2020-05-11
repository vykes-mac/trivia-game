module Questions
  class FetchQuestions
    prepend SimpleCommand
    include Questions

    def initialize(categories)
      @categories = categories
    end

    def call
      create_dto(fetch_questions)
    end

    private

    attr_accessor :categories

    def fetch_questions
      return fetch_all if categories.empty?

      categ = fetch_categories
      return errors.add :not_found, 'document not found' if categ.nil?

      categ
    end

    def fetch_all
      random = rand
      @res = Question.where(:random.gte => random).limit(10)
      return @res unless @res.empty?

      Question.where(:random.lte => random).limit(10)
    end

    def fetch_categories
      random = rand
      @res = Question.where(:random.gte => random, :categories.in => categories).limit(10)
      return @res unless @res.empty?

      Question.where(:random.lte => random, :categories.in => categories).limit(10)
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
