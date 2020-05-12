module Scores
  class AddScore
    prepend SimpleCommand
    include Scores

    def initialize(score, correct_streak, incorrect_streak,
                   best_category)
      @score = score
      @correct_streak = correct_streak
      @incorrect_streak = incorrect_streak
      @best_category = best_category
    end

    def call
      add_score
    end

    private

    attr_accessor :score, :correct_streak, :incorrect_streak, :best_category

    def add_score
      score = Score.new(score: score, correct_streak: correct_streak,
                        incorrect_streak: incorrect_streak,
                        best_category: best_category)
      score.insert
    end
  end
end
