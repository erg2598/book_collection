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
  
end