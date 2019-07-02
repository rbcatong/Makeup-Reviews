class Review < ApplicationRecord
  belongs_to :user
  belongs_to :makeup

  validates :content,
  presence: true,
  length: {maximum: 20},
  on: :create,
  allow_nil: false

end
