module Questions
  class Question
    include Mongoid::Document
    field :question, type: String
    field :answer, type: String
    field :choices, type: Array
    field :categories, type: Array
    field :created_by

    validates :question, :answer, :choices, presence: true
    index({ created_by: 1 }, { unique: true, background: true })
  end
end
