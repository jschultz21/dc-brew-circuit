
require_relative './brewery_data.rb'
require_relative './beer_data.rb'
# require_relative './quote_data.rb'


Brewery.destroy_all
Beer.destroy_all
Quote.destroy_all

brewery_data = get_brewery_data()
beer_data =  get_beer_data()

# quote_data = get_quote_data()
#
#
# quote_data.each do |quote|
#   info = quote_data[quote]
#   Quote.create!({
#     text:       info[:text],
#     author:      info[:author]
#     })
#   end

 quotes = Quote.create! ([{text: '"He was a wise man who invented beer."', author: 'Plato'}, {text: '“Beer, if drunk in moderation, softens the temper, cheers the spirit and promotes health.”',author: 'Thomas Jefferson'},{text: '“In a study, scientists report that drinking beer can be good for the liver. I’m sorry, did I say ‘scientists’? I meant Irish people.”', author: 'Tina Fey'}])


beer_data.each_pair do |brewery_name, beers|
  info = brewery_data[brewery_name]
  current_brewery = Brewery.create!({
    name:       info[:name],
    photo_url:  info[:photo_url],
    logo_img:    info[:logo_img],
    address:    info[:address]
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
