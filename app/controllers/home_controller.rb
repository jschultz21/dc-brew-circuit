class HomeController < ApplicationController
  def index
    @breweries = Brewery.all.sample(3)
  end
end
