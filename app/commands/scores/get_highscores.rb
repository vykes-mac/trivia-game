module Scores
  class GetHighscores
    prepend SimpleCommand
    include Scores

    def call
      highscores
    end

    private

    def highscores
      top = Score.all.order_by(score: :desc).limit(10).to_a
      bottom = Score.all.order_by(score: :asc).limit(10).to_a
      (top + bottom.reverse).uniq
    end
  end
end
