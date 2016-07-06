class HomeController < ApplicationController
  def index
    @breweries = Brewery.all.sample(3)
    @quote = Quote.all.sample(1)
  end
end
