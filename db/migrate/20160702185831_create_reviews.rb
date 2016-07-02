class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

      t.string :body
      t.string :author
      t.integer :beer_id
      t.timestamps null: false
    end
  end
end
