class UsersController < ApplicationController

  def show
   @book = Book.new
   @user = User.find(current_user[:id])
   @books = @user.books

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to about_path
  end

  def index
    @users = User.all
    @books = Book.all

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user[:id])
    @user.update(user_params)
    redirect_to about_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)

  end

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
