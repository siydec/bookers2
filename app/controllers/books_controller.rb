class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to action: "show", id: @book
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(current_user[:id])
    @book_new = Book.new


  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)

  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
