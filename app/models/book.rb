class Book < ApplicationRecord

  belongs_to :user
  has_many :memos, dependent: :destroy

  validates :title, presence: true

end
