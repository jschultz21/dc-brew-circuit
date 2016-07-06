class Favorite < ActiveRecord::Base
  belongs_to :beer
  belongs_to :favorited, polymorphic: true
belongs_to :user
end
