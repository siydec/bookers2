class UsersController < ApplicationController

  def show
   @book = Book.new
   @user = User.find(params[:id])
   @books = @user.books

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to about_path
  end

  def index
    @user = User.find(current_user[:id])
    @users = User.all
    @books = Book.all
    @books = User.id


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to about_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)

  end

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end


end
