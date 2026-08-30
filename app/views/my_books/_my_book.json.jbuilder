json.extract! my_book, :id, :title, :created_at, :updated_at
json.url my_book_url(my_book, format: :json)
