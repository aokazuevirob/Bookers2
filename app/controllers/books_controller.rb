class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @newbook = Book.new
    @user = current_user
    if @book.save
      redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    else
    @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @newbook = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @books = Book.all
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @user =@book.user
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'You have update book successfully.'
    elsif
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end
