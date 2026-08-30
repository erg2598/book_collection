class MyBooksController < ApplicationController
  before_action :set_my_book, only: %i[ show edit update destroy ]

  # GET /my_books or /my_books.json
  def index
    @my_books = MyBook.all
  end

  # GET /my_books/1 or /my_books/1.json
  def show
  end

  # GET /my_books/new
  def new
    @my_book = MyBook.new
  end

  # GET /my_books/1/edit
  def edit
  end

  # POST /my_books or /my_books.json
  def create
    @my_book = MyBook.new(my_book_params)

    respond_to do |format|
      if @my_book.save
        format.html { redirect_to @my_book, notice: "My book was successfully created." }
        format.json { render :show, status: :created, location: @my_book }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @my_book.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /my_books/1 or /my_books/1.json
  def update
    respond_to do |format|
      if @my_book.update(my_book_params)
        format.html { redirect_to @my_book, notice: "My book was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @my_book }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @my_book.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /my_books/1 or /my_books/1.json
  def destroy
    @my_book.destroy!

    respond_to do |format|
      format.html { redirect_to my_books_path, notice: "My book was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_book
      @my_book = MyBook.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def my_book_params
      params.expect(my_book: [ :title ])
    end
end
