module AddMemoSupport
  def add_memo(memo)
    click_on memo.book.title
    expect(page).to have_content('メモの追加')
    click_on 'メモの追加'
    expect(page).to have_content('メモの登録')
    image_path = Rails.root.join('app/assets/images/read_book.jpg')
    attach_file('memo[image]', image_path, make_visible: true)
    fill_in 'memo_memo', with: memo.memo
    click_on 'メモを登録'
    expect(page).to have_content(memo.memo)
  end
end