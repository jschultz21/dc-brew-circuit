class Beer < ActiveRecord::Base
  belongs_to :brewery
  validates :name, presence: true
  validates :style, presence: true
  has_many :reviews
end
