class CreateSaves < ActiveRecord::Migration
  def change
    create_table :saves do |t|
      t.integer :brewery_id
      t.integer :user_id
      t.references :saved, polymorphic: true, index: true
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
