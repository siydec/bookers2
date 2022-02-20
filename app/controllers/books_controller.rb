class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if@book.save
    flash[:notice] = "You have created book successfully."
    redirect_to action: "show", id: @book
   else
    @books = Book.all
    @user = User.find(current_user[:id])
    render :index


   end
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
    if current_user.id != @book.user_id
      redirect_to action: "index"
    else
    @book = Book.find(params[:id])
    end
  end

  def update
    @book = Book.find(params[:id])
    if@book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    render :edit
    end
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
