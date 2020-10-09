class UsersController < ApplicationController
  before_action :check_login, only: :show
  before_action :user, only: :show

  def index
    redirect_to user_path(current_user.id) if user_signed_in?
  end

  def show
    @books = @user.books.page(params[:page]).per(8)
  end

  private

  def user
    @user = User.find(params[:id])
  end

  def check_login
    redirect_to root_path unless user_signed_in?
  end
end
