class BooksController < ApplicationController


  def index
    @book = Book.new
    @user = current_user
    @books = Book.all

  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
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

    def edit
      binding.pry
      @book = Book.find(params[:id])
    end

    def update
      @book = Book.find(params[:id])
     if @book.update(book_params)
        redirect_to books_path(@book), notice: 'You have updated book successfully.'
     else
        render :edit
     end
    end

    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path
    end
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
