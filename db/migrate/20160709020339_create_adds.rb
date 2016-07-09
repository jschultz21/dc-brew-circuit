class CreateAdds < ActiveRecord::Migration
  def change
    create_table :adds do |t|
      t.integer :brewery_id
      t.integer :user_id
      t.references :added, polymorphic: true, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
