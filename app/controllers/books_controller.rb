class BooksController < ApplicationController
  before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "You have created book successfully."

    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def show
    # @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
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
  def book_params
    params.require(:book).permit(:title, :body)
  end
  def correct_user
    @book = Book.find(params[:id])
    # まず本を取り出す
    @user = @book.user
    # 本に結びついたユーザーを取り出す
    if current_user != @user
      redirect_to books_path
    # 正しいユーザーではない場合本一覧に戻す
    end
  end
end
