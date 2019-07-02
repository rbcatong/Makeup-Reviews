class Review < ApplicationRecord
  belongs_to :user
  belongs_to :makeup

  after_save :update_user_points,
                  if: Proc.new { |review| review.user.reviews.count > 1 }

      private
      def update_user_points
        self.user.points += 10
        self.user.points.save
      end
end
