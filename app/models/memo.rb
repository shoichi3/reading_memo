class Memo < ApplicationRecord

  has_many :user
  has_many :book
  has_one_attached :image

  validates :memo, presence: true
end
