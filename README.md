# DC Brew Circuit

## Technologies Used
Ruby on Rails, active record for PostgreSQL, Heroku for deployment, polymorphic associations, stack overflow and a lot of iced coffee.

<!-- NHO: Local Setup?  -->

### Gems
* Pry: for debugging
* Devise: I used this to develop the User sign up, login, and authentication.
* Geocoder: this takes an address and assigns the coordinates to latitude and longitude variables on every Brewery.


## Approach Taken
I started small, once I had the beer and brewery models up and running, I implemented crud functionality on the Beer model allowing users to add new beers. Next, I added reviews for beers; and this model also allowed for CRUD. Before using the Devise gem, I had created user and session models to begin setting permissions, which initially were only determined based on whether a user was logged in or not. Using Devise, I was able to specify permissions based on whether or not a user 'owned' certain content. Using current_user permissions, I implemented the favoriting and add-to-route functionalities fairly smoothly. Next, I used the Geocoder gem to pull coordinates for each Brewery's address. On each Brewery's show page, there is now a static Google Map with a marker for the Brewery's location.

## Unsolved Problems
  <!-- NHO: you need to render your "route" data as JSON, then use that data in the view   -->
  1. I couldn't figure out how to use Javascript to create a dynamic Google map on the Route page so that a user could see all of his/her favorite breweries plotted on a map.
  <!-- NHO: In the future you could use it to pull data for any beer / brewery added, maybe as a model method in an after_create  -->
  2. I couldn't figure out how to include the Untappd AP (but I did receive a private key, so will be able to use it in the future!!)
  <!-- NHO: look into figaro!  -->
  3. Speaking of keys, my Google maps API key is in one of the files that I've committed to Github. Where do I put it so that it can be referenced, but won't appear on GitHub??

## Future Improvements
Besides the two
  1. Each user's 'route' page would include a dynamic Google map with markers for every brewery that the user had added to his/her route. I got a little closer to this goal by implementing the geocoder gem to create coordinates for all of the Breweries.
  2. Untappd API to include reviews and other beer/brewery information from users across the internet.
  3. I need to improve user experience, specifically with regard to adding breweries to a route and favoriting beers.
  4. Main Page will have stream of most recent comments made on beers on the site.
  5. Using cancancan gem I'll implement a 'brewmaster' permission that will allow admin users (Brewmasters) to add breweries and edit the breweries that they add.
  6. Each Brewery will have its twitter feed on its show page.


## Bronze, Silver, Gold Products
### Bronze
* Brewery Model with multiple Breweries
* Beer Model
* User can post reviews on beers
* Users can login
* Users can favorite beers, but only if logged in

### Silver
* Favorites are specific to the user, not a function of whether or not someone is logged in
* Each user can view all of his/her favorited beers on a Favorites pages
* User can add a brewery to his/her 'route'
* Each user can view his 'route' an a user-specific 'route' page.
* A 'quote' model so that the footer can include a random beer-related quote on every page load.
* Each Brewery show page has it's twitter feed
* Each Brewery show page has a small map with brewery location.

### Gold
* The breweries added to a user's route page show up as markers on a google map
* Implement cancan gem allowing for members and brewmasters.
* Brewmasters can edit breweries' information.
* Untappd API to include reviews of each
