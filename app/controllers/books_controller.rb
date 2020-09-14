class BooksController < ApplicationController

  before_action :get_book, only: [:show]

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

  def show
  end

  private

  def book_params
    params.require(:book).permit(:title).merge(user_id: current_user.id)
  end

  def get_book
    @book = Book.find(params[:id])
  end

end
