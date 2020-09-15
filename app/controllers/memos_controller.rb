class MemosController < ApplicationController

  before_action :get_book, only: [:new, :create]

  def new
    @book = Book.find(params[:book_id])
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to book_path(@memo.book)
    else
      render "memos/new"
    end
  end

  private

  def memo_params
    params.require(:memo).permit(:image, :memo).merge(user_id: current_user.id, book_id: params[:book_id])
  end

  def get_book
    @book = Book.find(params[:book_id])
  end
end
