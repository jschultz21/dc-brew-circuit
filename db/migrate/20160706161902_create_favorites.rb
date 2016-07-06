class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :beer_id
      t.integer :user_id
      t.references :user
      t.references :beer

      t.timestamps null: false
    end
  end
end
