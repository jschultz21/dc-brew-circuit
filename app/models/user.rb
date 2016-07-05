class User < ActiveRecord::Base
  has_many :reviews
  attr_accessor :name, :email
  validates :name, presence: true
  validates :email, presence: true

end
