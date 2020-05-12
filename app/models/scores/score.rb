module Scores
  class Score
    include Mongoid::Document
    field :score, type: Integer
    field :correct_streak, type: Integer
    field :incorrect_streak, type: Integer
    field :best_category, type: String
    field :owned_by

    validates :score, :owned_by, presence: true
    index({ owned_by: 1 }, { unique: true, background: true })
  end
end
