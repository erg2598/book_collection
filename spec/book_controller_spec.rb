require 'rails_helper'

RSpec.describe BookController, type: :controller do

  #creation unit test - sunny day
  describe "POST #create" do
    it "creates a book and adds it to the database" do
      #ARRANGE
      book_params = {
        title: "Test Title",
        author: "Test Author",
        price: 19.99,
        published_date: Date.new(2026, 9, 14)
      }
      #ACT This creates the book while checking to see if the count increased by 1
      expect {
        post :create, params: { book: book_params }
      }.to change(Book, :count).by(1)
      #ASSERT
      #This is making sure the page redirects
      expect(response).to redirect_to(root_path)
      #This is making sure the flash notice pops up
      expect(flash[:notice]).to eq("Book created successfully!")
    end
  end

  #creation unit test - rainy day
  describe "POST #create" do
    it "fails to create a book" do
      #ARRANGE
      book_params = {
        title: ""
      }
      #ACT This creates the book while checking to see if the count increased by 1
      expect {
        post :create, params: { book: book_params }
      }.to change(Book, :count).by(0)
      #ASSERT
      #This is making sure the page doesn't redirect
      expect(response).to render_template(:new)
      #This is making sure the flash notice doesn't pop up
      expect(flash[:notice]).to eq(nil)
    end
  end

  
describe "POST #create" do

  # AUTHOR - SUNNY
  it "creates a book with an author" do
    book_params = {
      title: "Test Title",
      author: "Test Author",
      price: 19.99,
      published_date: Date.new(2026, 9, 14)
    }

    expect {
      post :create, params: { book: book_params }
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
      post :create, params: { book: book_params }
    }.to change(Book, :count).by(0)

    expect(response).to render_template(:new)
    expect(flash[:notice]).to eq(nil)
  end


  # PRICE - SUNNY
  it "creates a book with a price" do
    book_params = {
      title: "Test Title",
      author: "Test Author",
      price: 19.99,
      published_date: Date.new(2026, 9, 14)
    }

    expect {
      post :create, params: { book: book_params }
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
      post :create, params: { book: book_params }
    }.to change(Book, :count).by(0)

    expect(response).to render_template(:new)
  end


  # PUBLISHED DATE - SUNNY
  it "creates a book with a published date" do
    book_params = {
      title: "Test Title",
      author: "Test Author",
      price: 19.99,
      published_date: Date.new(2026, 9, 14)
    }

    expect {
      post :create, params: { book: book_params }
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
      post :create, params: { book: book_params }
    }.to change(Book, :count).by(0)

    expect(response).to render_template(:new)
  end

end


end