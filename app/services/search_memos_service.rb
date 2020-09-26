class SearchMemosService
  def self.search(search, book)
    if search != ''
      Memo.where('memo LIKE(?)', "%#{search}%").where(book_id: book.id)
    else
      Memo.where(book_id: book.id)
    end
  end
end
