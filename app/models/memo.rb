class Memo < ApplicationRecord

  belongs_to :user
  belongs_to :book
  has_one_attached :image

  validates :image, presence: true
  validates :memo, presence: true

  def self.search(search, book)
    if search != ''
      Memo.where('memo LIKE(?)', "%#{search}%").where(book_id: book.id)
    else
      Memo.where(book_id: book.id)
    end
  end
end
