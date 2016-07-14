class Beer < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :user
  # NHO: what happened to this functionality? Are you planning on using a polymorhpic relationship?
  # NHO: has_many :favorites, as: :favorited
  # has_many :favorites
  # has_many :users, through: :favorites

  validates :name, presence: true
  validates :style, presence: true
  has_many :reviews, dependent: :destroy
end
