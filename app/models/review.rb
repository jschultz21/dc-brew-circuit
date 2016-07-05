class Review < ActiveRecord::Base
  validates :author, presence: :true
  validates :body, presence: :true


  belongs_to :beer
end
