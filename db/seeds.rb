
require_relative './brewery_data.rb'
require_relative './beer_data.rb'

Brewery.destroy_all
Beer.destroy_all

brewery_data = get_brewery_data()
beer_data =  get_beer_data()

beer_data.each_pair do |brewery_name, beers|
  info = brewery_data[brewery_name]
  current_brewery = Brewery.create!({
    name:       info[:name],
    photo_url:  info[:photo_url],
    logo_img:    info[:logo_img],
    address:    info[:address],
    })

    beers.each do |beer|
      Beer.create!({
        name:       beer[:name],
        style:      beer[:style],
        photo_url:  beer[:photo_url],
        abv:        beer[:abv],
        brewery:    current_brewery
        })
      end
    end
