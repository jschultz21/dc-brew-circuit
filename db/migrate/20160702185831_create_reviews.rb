class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

      t.string :body, null: false
      t.string :author, null: false
      t.integer :beer_id
      t.integer :brewery_id

      t.timestamps null: false
    end
  end
end
