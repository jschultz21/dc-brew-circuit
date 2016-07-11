class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :reviews
         has_many :beers

         has_many :adds
         has_many :added_breweries, through: :adds, source: :added, source_type: 'Brewery'

         has_many :favorites
         has_many :favorite_beers, through: :favorites, source: :favorited, source_type: 'Beer'
end
