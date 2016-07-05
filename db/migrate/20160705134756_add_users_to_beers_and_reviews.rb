class AddUsersToBeersAndReviews < ActiveRecord::Migration
  def change
    add_column :beers, :user_id, :integer
    add_column :reviews, :user_id, :integer
  end
end
