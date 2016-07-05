class Beer < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :user
  validates :name, presence: true
  validates :style, presence: true
  has_many :reviews, dependent: :destroy
end
