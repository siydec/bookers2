class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to about_path
  end

  def show
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user[:id])
    


  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)

  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
