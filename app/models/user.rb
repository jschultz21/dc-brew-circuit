class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :reviews
         has_many :beers

         has_many :adds # NHO: don't need this line thanks to the one below
         has_many :added_breweries, through: :adds, source: :added, source_type: 'Brewery'

         has_many :favorites # NHO: don't need this line thanks to the one below
         has_many :favorite_beers, through: :favorites, source: :favorited, source_type: 'Beer'
end
