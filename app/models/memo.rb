class Memo < ApplicationRecord

  belongs_to :user
  belongs_to :book
  has_one_attached :image

  validates :memo, presence: true
end
