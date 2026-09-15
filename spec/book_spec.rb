require 'rails_helper'

RSpec.describe "Book creation", type: :request do

    #creation integration test - sunny day
  describe "creating a book" do
    it "creates a book and redirects the user" do
      # ARRANGE
      book_params = {
        title: "Test Title"
      }
      # ACT
      expect{post books_path, params: { book: book_params }}.to change(Book, :count).by(1)
      # ASSERT
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq("Book created successfully!")
    end
  end

    #creation integration test - rainy day
  describe "creating a book" do
    it "fails to create a book" do
      # ARRANGE
      book_params = {
        title: ""
      }
      # ACT
      expect{post books_path, params: { book: book_params }}.to change(Book, :count).by(0)
      # ASSERT
      expect(response).to render_template(:new)
      expect(flash[:notice]).to eq(nil)
    end
  end


describe "POST #create" do

  # AUTHOR - SUNNY
  it "creates a book with an author" do
    book_params = {
      title: "Test Title",
      author: "Test Author"
    }

    expect {
      post books_path, params: { book: book_params }
    }.to change(Book, :count).by(1)

    expect(Book.last.author).to eq("Test Author")
  end

  # AUTHOR - RAINY
  it "fails to create a book without an author" do
    book_params = {
      title: "Test Title",
      author: ""
    }

    expect {
      post books_path, params: { book: book_params }
    }.to change(Book, :count).by(1)

    expect(Book.last.author).to eq("")
  end


  # PRICE - SUNNY
  it "creates a book with a price" do
    book_params = {
      title: "Test Title",
      price: 19.99
    }

    expect {
      post books_path, params: { book: book_params }
    }.to change(Book, :count).by(1)

    expect(Book.last.price).to eq(19.99)
  end

  # PRICE - RAINY
  it "fails to create a book with an invalid price" do
    book_params = {
      title: "Test Title",
      price: "not a number"
    }

    expect {
      post books_path, params: { book: book_params }
    }.to change(Book, :count).by(0)

    expect(response).to render_template(:new)
  end


  # PUBLISHED DATE - SUNNY
  it "creates a book with a published date" do
    book_params = {
      title: "Test Title",
      published_date: Date.new(2026, 9, 14)
    }

    expect {
      post books_path, params: { book: book_params }
    }.to change(Book, :count).by(1)

    expect(Book.last.published_date).to eq(Date.new(2026, 9, 14))
  end

  # PUBLISHED DATE - RAINY
  it "fails to create a book with an invalid published date" do
    book_params = {
      title: "Test Title",
      published_date: "not a date"
    }

    expect {
      post books_path, params: { book: book_params }
    }.to change(Book, :count).by(0)

    expect(response).to render_template(:new)
  end

end


end