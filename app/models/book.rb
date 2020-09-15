class Book < ApplicationRecord

  # has_many :user_books
  # has_many :users, through: :user_books
  belongs_to :user
  has_many :memos, dependent: :destroy

  validates :title, presence: true
end
