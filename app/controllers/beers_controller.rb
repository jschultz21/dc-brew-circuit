class BreweriesController < ApplicationController

  def show
    @brewery = Brewery.find(params[:id])
    @beers = @brewery.Beer.all
  end
end
