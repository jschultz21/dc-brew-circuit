class Add < ActiveRecord::Base
    belongs_to :brewery
    belongs_to :added, polymorphic: true
    belongs_to :user
  end
