class UsersController < ApplicationController

  def new
    @book = Book.new
  end

  def show
   @book = Book.new
   @user = User.find(params[:id])
   @books = @user.books
   

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

  def index
    @book = Book.new
    @user = User.find(current_user[:id])
    @users = User.all
    @books = Book.all


  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to action: "show", id: current_user.id
    else
      @user = User.find(params[:id])
    end
  end

  def update
    @user = User.find(params[:id])
    if@user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to action: "show", id: @user
    else
     render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)

  end

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end


end
