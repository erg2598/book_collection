require 'rails_helper'

RSpec.describe BookController, type: :controller do

  #creation unit test - sunny day
  describe "POST #create" do
    it "creates a book and adds it to the database" do
      #ARRANGE
      book_params = {
        title: "Test Title"
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
end