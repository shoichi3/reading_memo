require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = FactoryBot.build(:book)
  end
  describe '本追加機能' do
    it '本のタイトルが入力されている場合、本を追加できる' do
      expect(@book).to be_valid
    end

    it '本のタイトルが空白の場合、本を追加することはできない' do
      @book.title = nil
      @book.valid?
      expect(@book.errors.full_messages).to include("Title can't be blank")
    end
  end
end
