module Scores
  class GetUserHighscore
    prepend SimpleCommand
    include Scores

    def initialize(current_user)
      @current_user = current_user
    end

    def call
      user_score
    end

    private

    attr_accessor :current_user

    def user_score
      Score.where(owned_by: current_user.id).order_by(score: :desc).limit(1)
    end
  end
end
