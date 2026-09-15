class BookController < ApplicationController
  def index
    @books = Book.order(:id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to(root_path, notice: "Book created successfully!")
    else
       render('new')
    end

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to(root_path, notice: "Book updated successfully!")
    else
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to(root_path, notice: "Book deleted successfully!")
  end
  
  private
  def book_params
    params.require(:book).permit(:title)
  end

  
end

