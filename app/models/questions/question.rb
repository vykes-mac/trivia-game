module Questions
  class Question
    include Mongoid::Document
    field :question, type: String
    field :answer, type: String
    field :choices, type: Array
    field :categories, type: Array
    field :created_by
    field :random

    validates :question, :answer, :choices, presence: true
    index({ categories: 1, random: 1 }, { unique: true, background: true })
  end
end
