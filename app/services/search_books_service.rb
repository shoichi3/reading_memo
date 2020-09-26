class SearchBooksService
  def self.search(search, user)
    if search != ''
      Book.where('title LIKE(?)', "%#{search}%").where(user_id: user.id)
    else
      Book.where(user_id: user.id)
    end
  end
end
