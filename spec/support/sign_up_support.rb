module SignUpSupport
  def sign_up(user)
    visit root_path
    expect(page).to have_content('新規登録')
    click_on '新規登録'
    fill_in 'name', with: user.name
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    fill_in 'password_confirmation', with: user.password_confirmation
    expect  do
      click_on 'Sign In'
    end.to change { User.count }.by(1)
    expect(page).to have_content(user.name)
  end
end
