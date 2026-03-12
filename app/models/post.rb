class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :amount, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :category
  has_many :comments, dependent: :destroy
  before_create :set_posted_on

    private

  def set_posted_on
    self.posted_on ||= Date.today
  end
end
