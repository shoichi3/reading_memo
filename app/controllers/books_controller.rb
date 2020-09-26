class BooksController < ApplicationController
  before_action :check_login
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
    @memos = @book.memos.order('created_at DESC').page(params[:page]).per(3)
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
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
    @books = SearchBooksService.search(params[:keyword], @user).page(params[:page]).per(8)
  end

  private

  def book_params
    params.require(:book).permit(:title).merge(user_id: current_user.id)
  end

  def get_title
    @book = Book.find(params[:id])
  end

  def check_login
    redirect_to root_path unless user_signed_in?
  end
end
