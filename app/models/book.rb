class Book < ApplicationRecord

  has_many :user_books
  has_many :users, through: :user_books
  has_many :memos

  validate :title, presence: true
end
