module Scores
  class GetBestCategory
    prepend SimpleCommand
    include Scores

    def initialize(current_user)
      @current_user = current_user
    end

    def call
      best_category
    end

    private

    attr_accessor :current_user

    def best_category
      cat = Score.collection.aggregate(
        stages,
        { allow_disk_use: true }
      ).first
      return cat['_id'] if cat
    end

    def stages
      [{ '$match' => { 'owned_by' => current_user.id } },
       { '$group' => {
         '_id' => '$best_category',
         'count' => { '$sum' => 1 }
       } },
       { '$sort' => { 'count' => -1 } },
       { '$limit' => 1 }]
    end
  end
end
