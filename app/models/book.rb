class Book < ApplicationRecord

  # has_many :user_books
  # has_many :users, through: :user_books
  belongs_to :user
  has_many :memos, dependent: :destroy

  validates :title, presence: true

  def self.search(search, user)
    if search != ''
      Book.where('title LIKE(?)', "%#{search}%").where(user_id: user.id)
    else
      Book.where(user_id: user.id)
    end
  end
end
