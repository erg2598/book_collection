require "application_system_test_case"

class MyBooksTest < ApplicationSystemTestCase
  setup do
    @my_book = my_books(:one)
  end

  test "visiting the index" do
    visit my_books_url
    assert_selector "h1", text: "My books"
  end

  test "should create my book" do
    visit my_books_url
    click_on "New my book"

    fill_in "Title", with: @my_book.title
    click_on "Create My book"

    assert_text "My book was successfully created"
    click_on "Back"
  end

  test "should update My book" do
    visit my_book_url(@my_book)
    click_on "Edit this my book", match: :first

    fill_in "Title", with: @my_book.title
    click_on "Update My book"

    assert_text "My book was successfully updated"
    click_on "Back"
  end

  test "should destroy My book" do
    visit my_book_url(@my_book)
    click_on "Destroy this my book", match: :first

    assert_text "My book was successfully destroyed"
  end
end
