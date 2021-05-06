class UsersController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = User.all
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(current_user)
       redirect_to user_path(@user), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    if @book.save
       redirect_to book_path(@book), notice: 'You have created book successfully.'
    else
      @books = Book.all
      render :index
    end
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
