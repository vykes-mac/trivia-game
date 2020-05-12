module Scores
  class GetHighscores
    prepend SimpleCommand
    include Scores

    def call
      highscores
    end

    private

    def highscores
      Score.all.order_by(score: :desc)
    end
  end
end
