class Review < ActiveRecord::Base
  belongs_to :user
  validates :body, presence: :true
  belongs_to :beer
  belongs_to :user
end
