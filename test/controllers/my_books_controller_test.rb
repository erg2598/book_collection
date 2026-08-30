require "test_helper"

class MyBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_book = my_books(:one)
  end

  test "should get index" do
    get my_books_url
    assert_response :success
  end

  test "should get new" do
    get new_my_book_url
    assert_response :success
  end

  test "should create my_book" do
    assert_difference("MyBook.count") do
      post my_books_url, params: { my_book: { title: @my_book.title } }
    end

    assert_redirected_to my_book_url(MyBook.last)
  end

  test "should show my_book" do
    get my_book_url(@my_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_book_url(@my_book)
    assert_response :success
  end

  test "should update my_book" do
    patch my_book_url(@my_book), params: { my_book: { title: @my_book.title } }
    assert_redirected_to my_book_url(@my_book)
  end

  test "should destroy my_book" do
    assert_difference("MyBook.count", -1) do
      delete my_book_url(@my_book)
    end

    assert_redirected_to my_books_url
  end
end
