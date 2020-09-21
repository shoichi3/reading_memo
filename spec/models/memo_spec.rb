require 'rails_helper'

RSpec.describe Memo, type: :model do
  before do
    @memo = FactoryBot.build(:memo)
    @memo.image = fixture_file_upload('public/images/1491.jpg')
  end

  describe 'メモ追加機能' do
    it '画像とメモが入力されている場合、メモを追加することができる' do
      expect(@memo).to be_valid
    end

    it '画像が空の場合、メモを追加することはできない' do
      @memo.image = nil
      @memo.valid?
      expect(@memo.errors.full_messages).to include("Image can't be blank")
    end
    
    it 'メモが空の場合、メモを追加することはできない' do
      @memo.memo = nil
      @memo.valid?
      expect(@memo.errors.full_messages).to include("Memo can't be blank")
    end
  end
end
