require 'rails_helper'

RSpec.describe '本追加機能', type: :system do
  before do
    @book = FactoryBot.build(:book)
  end
  context '本を追加することができるとき' do
    it '本のタイトルを入力すると、本を追加することができる' do
      sign_up(@book.user)
      add_book(@book)
    end
  end
  context '本を追加することができないとき' do
    it '本のタイトルが空のとき、本を追加することができない' do
      sign_up(@book.user)
      click_on '本の追加'
      expect(current_path).to eq new_book_path
      fill_in 'book_title', with: ""
      expect{
        click_on '本を登録'
      }.to change{ Book.count }.by(0)
      expect(current_path).to eq books_path
    end
    it 'サインインせずに本を追加しようとすると、トップページへ遷移する' do
      visit new_book_path
      expect(current_path).to eq root_path
    end
  end
end

RSpec.describe '本編集機能', type: :system do
  before do
    @book = FactoryBot.build(:book)
  end
  context '本のタイトルを編集することができるとき' do
    it '本のタイトルを編集すると、編集した内容を反映させることができる' do
      sign_up(@book.user)
      add_book(@book)
      click_on @book.title
      expect(page).to have_content('本の編集')
      click_on '本の編集'
      expect(page).to have_content('タイトルの編集') 
      fill_in 'book_title', with: "#{@book.title} + 編集した内容"
      click_on '本を編集'
      expect(page).to have_content("#{@book.title} + 編集した内容")
    end
  end
  context '本のタイトルを編集することができないとき' do
    it '本のタイトルが空のとき、本のタイトルを編集することはできない' do
      sign_up(@book.user)
      add_book(@book)
      click_on @book.title
      expect(page).to have_content('本の編集')
      click_on '本の編集'
      expect(page).to have_content('タイトルの編集') 
      fill_in 'book_title', with: ""
      click_on '本を編集'
      expect(page).to have_content('タイトルの編集')
    end
    it 'サインインせずに本のタイトルを編集しようとすると、トップページへ遷移する' do
      visit edit_book_path(1)
      expect(current_path).to eq root_path
    end
  end
end

RSpec.describe '本削除機能', type: :system do
  before do
    @book = FactoryBot.build(:book)
  end
  context '本を削除することができるとき' do
    it '本の削除をクリックすると、指定した本を削除することができる' do
      sign_up(@book.user)
      add_book(@book)
      click_on(@book.title)
      expect(page).to have_content('本の削除')
      expect{
        click_on '本の削除'
      }.to change{ Book.count }.by(-1)
      expect(page).to have_content('本の追加')
    end
  end
  context '本を削除することができないとき' do
    it 'サインインせずに本の削除ページへ遷移しようとすると、トップページへ遷移する' do
      visit book_path(1) 
      expect(current_path).to eq root_path
    end
  end
end