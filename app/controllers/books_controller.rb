class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title).merge(user_id: current_user.id)
  end
end
