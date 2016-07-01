class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.string :photo_url
      t.string :abv
      t.integer :brewery_id

      t.timestamps null: false
    end
  end
end
