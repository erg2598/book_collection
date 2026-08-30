class CreateMyBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :my_books do |t|
      t.string :title

      t.timestamps
    end
  end
end
