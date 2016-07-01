class BeersController < ApplicationController

  def show
    @brewery = Brewery.find(params[:id])
    @beers = @brewery.beers.all
  end

  def new
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.create!(beer_params)
  end

end



private
def beer_params
end
