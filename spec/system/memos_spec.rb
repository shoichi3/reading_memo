require 'rails_helper'

RSpec.describe 'メモ追加機能', type: :system do
  before do
    @memo = FactoryBot.build(:memo)
  end
  context 'メモを追加することができるとき' do
    it 'メモの該当ページの写真とメモの内容を入力すれば、メモを追加することができる' do
      sign_up(@memo.user)
      add_book(@memo.book)
      add_memo(@memo)
    end
  end
  context 'メモを追加することができないとき' do
    it 'メモの該当ページの写真が空のとき、メモを追加することができない' do
      sign_up(@memo.user)
      add_book(@memo.book)
      click_on @memo.book.title
      expect(page).to have_content('メモの追加')
      click_on 'メモの追加'
      expect(page).to have_content('メモの登録')
      fill_in 'memo_memo', with: @memo.memo
      click_on 'メモを登録'
      expect(page).to have_content('メモの登録')
    end
    it 'メモの内容が空のとき、メモを追加することができない' do
      sign_up(@memo.user)
      add_book(@memo.book)
      click_on @memo.book.title
      expect(page).to have_content('メモの追加')
      click_on 'メモの追加'
      expect(page).to have_content('メモの登録')
      image_path = Rails.root.join('app/assets/images/read_book.jpg')
      attach_file('memo[image]', image_path, make_visible: true)
      fill_in 'memo_memo', with: ""
      click_on 'メモを登録'
      expect(page).to have_content('メモの登録')
    end
    it 'サインインせずにメモを追加しようとすると、トップページへ遷移する' do
      visit new_book_memo_path(3)
      expect(current_path).to eq root_path
    end
  end
end

RSpec.describe 'メモ編集機能', type: :system do
  before do
    @memo = FactoryBot.build(:memo)
  end
  context 'メモを編集することができるとき' do
    it 'メモの内容を変更したとき、変更した内容を反映させることができる' do
      sign_up(@memo.user)
      add_book(@memo.book)
      add_memo(@memo)
      click_on @memo.memo
      expect(page).to have_content('メモの編集')
      click_on 'メモの編集'
      expect(page).to have_content('メモの編集')
      fill_in 'memo_memo', with: "#{@memo.memo} + 編集した内容"
      click_on 'メモを編集'
      expect(page).to have_content("#{@memo.memo} + 編集した内容")
    end
  end
  context 'メモを編集することができないとき' do
    it 'メモが空のとき、メモを編集することはできない' do
      sign_up(@memo.user)
      add_book(@memo.book)
      add_memo(@memo)
      click_on @memo.memo
      expect(page).to have_content('メモの編集')
      click_on 'メモの編集'
      expect(page).to have_content('メモの編集')
      fill_in 'memo_memo', with: ""
      click_on 'メモを編集'
      expect(page).to have_content("メモの編集")
    end
    it 'サインインせずにメモを編集しようとすると、トップページへ遷移する' do
      visit edit_book_memo_path(1, 1)
      expect(current_path).to eq root_path
    end
  end
end

RSpec.describe 'メモ削除機能', type: :system do
  before do
    @memo = FactoryBot.build(:memo)
  end
  context 'メモを削除することができるとき' do
    it 'メモの削除をクリックすると、指定したメモを削除することができる' do
      sign_up(@memo.user)
      add_book(@memo.book)
      add_memo(@memo)
      click_on @memo.memo
      expect(page).to have_content('メモの削除')
      expect{
        click_on 'メモの削除'
      }.to change{ Memo.count }.by(-1)
      expect(page).to have_no_content(@memo.memo)
    end
  end
  context 'メモを削除することができないとき' do
    it 'サインインせずにメモの削除ページへ遷移しようとしたとき、トップページへ遷移する' do
      visit book_memo_path(1, 1)
      expect(current_path).to eq root_path
    end
  end
end