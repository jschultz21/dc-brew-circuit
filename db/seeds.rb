
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

 quotes = Quote.create! ([

   {text: '"He was a wise man who invented beer."', author: 'Plato'},
   {text: '“Beer, if drunk in moderation, softens the temper, cheers the spirit and promotes health.”',author: 'Thomas Jefferson'},
   {text: '“In a study, scientists report that drinking beer can be good for the liver. I’m sorry, did I say ‘scientists’? I meant Irish people.”', author: 'Tina Fey'},


{text: '“Most people hate the taste of beer—to begin with. It is, however, a prejudice.”', author: 'Winston Churchill'},

{text: '“Beer, it’s the best damn drink in the world.”', author: 'Jack Nicholson'},

{text: '“There is no such thing as a bad beer. It’s that some taste better than others.”', author: 'Bill Carter'},

{text: '“Beer’s intellectual. What a shame so many idiots drink it.”', author: 'Ray Bradbury'},

{text: '“stay with the beer. beer is continuous blood. a continuous lover.”', author: 'Charles Bukowski'},

{text: '"A man who lies about beer makes enemies.”', author: 'Stephen King'},

{text: '“Whoever drinks beer, he is quick to sleep; whoever sleeps long, does not sin; whoever does not sin, enters Heaven! Thus, let us drink beer!”', author: 'Martin Luther'},

{text: '“For a quart of Ale is a dish for a king.”', author: 'William Shakespeare'},

{text: '“Give me a woman who loves beer and I will conquer the world.”', author: 'Kaiser Wilhelm'},

{text: '“I’ve never, ever tasted a beer.”', author: "Mike Huckabee"}
   ])


beer_data.each_pair do |brewery_name, beers|
  info = brewery_data[brewery_name]
  current_brewery = Brewery.create!({
    name:       info[:name],
    photo_url:  info[:photo_url],
    logo_img:    info[:logo_img],
    address:    info[:address],
    description: info[:description]
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
