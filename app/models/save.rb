class Save < ActiveRecord::Base
    belongs_to :brewery
    belongs_to :saved, polymorphic: true
    belongs_to :user
  end
