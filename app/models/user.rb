class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_books
  has_many :books, through: :user_books
  has_many :memos

  validates :name, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  with_options presence: true, format: { with: PASSWORD_REGEX, message: 'Include both letters and numbers' } do
    validates :password
  end
end
