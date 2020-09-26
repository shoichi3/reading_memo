module AddBookSupport
  def add_book(book)
    click_on '本の追加'
    expect(current_path).to eq new_book_path
    fill_in 'book_title', with: book.title
    expect  do
      click_on '本を登録'
    end.to change { Book.count }.by(1)
    expect(page).to have_content(book.title)
  end
end
