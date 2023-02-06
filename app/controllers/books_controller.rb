class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: "投稿に成功しました"
    else
      flash[:alert] = "投稿に失敗しました"
      render :new
    end
  end 
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def index
    @book = Book.all
  end

  def show
    @book = Book.find (params[:id])

  end

  def edit
    @book = Book.find (params[:id])
  end
  
 def update
    book = Book.find(params[:id])
    redirect_to books_path, notice: "更新に成功しました"
    book.update(book_params)
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end