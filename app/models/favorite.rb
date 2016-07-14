class Favorite < ActiveRecord::Base
  # NHO: don't think you need the belongs to :beer, :user here
  # https://launchschool.com/blog/understanding-polymorphic-associations-in-rails
  belongs_to :beer
  belongs_to :favorited, polymorphic: true
  belongs_to :user
end
