class HomeController < ApplicationController
  def index
    @breweries = Brewery.all.sample(3)
    @quotes = Quote.all.sample(1)
  end
end
