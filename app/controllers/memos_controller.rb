class MemosController < ApplicationController
  before_action :check_login
  before_action :book, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :memo, only: [:show, :edit, :update, :destroy]

  def new
    @book = Book.find(params[:book_id])
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to book_path(@memo.book)
    else
      render 'memos/new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @memo.update(memo_params)
      redirect_to book_memo_path(@book, @memo)
    else
      render :edit
    end
  end

  def destroy
    if @memo.destroy
      redirect_to book_path(@book)
    else
      render :show
    end
  end

  def search
    @book = Book.find(params[:id])
    @memos = SearchMemosService.search(params[:keyword], @book).page(params[:page]).per(3)
  end

  private

  def memo_params
    params.require(:memo).permit(:image, :memo).merge(user_id: current_user.id, book_id: params[:book_id])
  end

  def book
    @book = Book.find(params[:book_id])
  end

  def memo
    @memo = Memo.find(params[:id])
  end

  def check_login
    redirect_to root_path unless user_signed_in?
  end
end
