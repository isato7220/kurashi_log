class Post < ApplicationRecord
  belongs_to :user
    validates :title, presence: true
  validates :amount, numericality: { only_integer: true }, allow_nil: true
  belongs_to :category

  enum category: {
    food: 0,
    daily: 1,
    utility: 2,
    hobby: 3,
    other: 4
  }
end