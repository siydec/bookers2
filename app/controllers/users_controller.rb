class UsersController < ApplicationController

  def show
   @book = Book.new
   @books = Book.all

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to about_path
  end

  def index

  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
