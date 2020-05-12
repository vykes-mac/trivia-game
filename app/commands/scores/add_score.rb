module Scores
  class AddScore
    prepend SimpleCommand
    include Scores

    def initialize(score, correct_streak, incorrect_streak,
                   best_category, current_user)
      @score = score
      @correct_streak = correct_streak
      @incorrect_streak = incorrect_streak
      @best_category = best_category
      @current_user = current_user
    end

    def call
      add_score
    end

    private

    attr_accessor :score, :correct_streak, :incorrect_streak, :best_category,
                  :current_user

    def add_score
      @score = Score.new(score: score, correct_streak: correct_streak,
                         incorrect_streak: incorrect_streak,
                         best_category: best_category, owned_by: current_user.id)

      errors.add :question_error, @score.errors unless @score.save!
      true
    end
  end
end
