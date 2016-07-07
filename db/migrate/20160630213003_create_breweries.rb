class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :photo_url
      t.string :address
      t.string :logo_img
      t.string :description

      t.timestamps null: false
    end
  end
end
