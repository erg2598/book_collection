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

end