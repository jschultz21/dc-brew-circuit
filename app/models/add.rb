class Add < ActiveRecord::Base
  # NHO: don't think you need the belongs to :brewery, :user here
  # https://launchschool.com/blog/understanding-polymorphic-associations-in-rails
    belongs_to :brewery
    belongs_to :added, polymorphic: true
    belongs_to :user
  end
