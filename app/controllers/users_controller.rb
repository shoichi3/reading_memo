class UsersController < ApplicationController

  before_action :check_login, only: :show
  before_action :get_current_user, only: [:show]

  def index
    if user_signed_in?
      redirect_to user_path(current_user.id)
    end
  end

  def show
    @books = @user.books.page(params[:page]).per(8)
  end

  private

  def get_current_user
    @user = User.find(params[:id])
  end

  def check_login
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
