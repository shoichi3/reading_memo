class BooksController < ApplicationController

  before_action :get_title, only: [:show, :edit, :update, :destroy]

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
    book = Book.find(params[:id])
    @memos = @book.memos.order('created_at DESC')
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def destroy
    if @book.destroy
      redirect_to user_path(current_user)
    else
      render :show
    end
  end

  def search
    @user = User.find(params[:id])
    @books = Book.search(params[:keyword], @user)
  end

  private

  def book_params
    params.require(:book).permit(:title).merge(user_id: current_user.id)
  end

  def get_title
    @book = Book.find(params[:id])
  end

end
