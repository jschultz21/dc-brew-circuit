class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.all.sample(Brewery.all.length)
  end

  def show
    @brewery = Brewery.find(params[:id])
  end
end
