class Post < ApplicationRecord
  belongs_to :user
    validates :title, presence: true
  validates :amount, numericality: { only_integer: true }, allow_nil: true
  belongs_to :category
has_many :comments, dependent: :destroy

end