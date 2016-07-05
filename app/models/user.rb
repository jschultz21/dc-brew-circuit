class User < ActiveRecord::Base
  has_many :reviews
  has_many :beers
  attr_accessor :name, :email
  validates :password, presence: true
  validates :email, uniqueness: :true, presence: true

end
