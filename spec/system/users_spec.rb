require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザーの新規登録ができるとき' do
    it '正しい情報を入力すると、ユーザーの新規登録ができマイページへ遷移する' do
      sign_up(@user)
    end
  end
  context 'ユーザーの新規登録ができないとき' do
    it '誤った情報を入力すると、ユーザーの新規登録ができない' do
      visit root_path
      expect(page).to have_content('新規登録')
      click_on '新規登録'
      fill_in 'name', with: ""
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password_confirmation', with: @user.password_confirmation
      expect{
        click_on 'Sign In'
      }.to change{ User.count }.by(0)
      expect(page).to have_content('Sign In')
    end
  end
end

RSpec.describe 'ログイン機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ユーザーがログインできるとき' do
    it '正しい情報を入力すると、ログインすることができる' do
      visit root_path
      expect(page).to have_content('ログイン')
      click_on 'ログイン'
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_on 'Log In'
      expect(current_path).to eq user_path(@user.id)
    end
  end
  context 'ユーザーがログインできないとき' do
    it '誤った情報を入力すると、ログインすることができない' do
      visit root_path
      expect(page).to have_content('ログイン')
      click_on 'ログイン'
      fill_in 'email', with: ""
      fill_in 'password', with: @user.password
      click_on 'Log In'
      expect(current_path).to eq new_user_session_path
    end
  end
end

RSpec.describe 'デモンストレーション機能', type: :system do
  context '例に示した本のメモを閲覧することができるとき' do 
    it 'Think clearlyをクリックするとメモを閲覧することができる' do
      visit root_path
      expect(page).to have_content("Think clearly")
      click_on 'Think clearly'
      expect(current_path).to eq examples_path
      expect(page).to have_content('Think clearly')
    end
    it '7つの習慣をクリックするとメモを閲覧することができる' do
      visit root_path
      expect(page).to have_content("Think clearly")
      click_on '7つの習慣'
      expect(current_path).to eq norms_path
      expect(page).to have_content('7つの習慣')
    end
    it '嫌われる勇気をクリックするとメモを閲覧することができる' do
      visit root_path
      expect(page).to have_content("嫌われる勇気")
      click_on '嫌われる勇気'
      expect(current_path).to eq illustrations_path
      expect(page).to have_content('嫌われる勇気')
    end
  end
end