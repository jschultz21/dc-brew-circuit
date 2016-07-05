class BeersController < ApplicationController

  def show
    @brewery = Brewery.find(params[:id])
    @beers = @brewery.beers.all
  end

  def show
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.find(params[:id])
    @review = @beer.reviews.new

  end

  def new
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.new
  end

  def create
    @brewery = Brewery.find(params[:brewery_id])
    @beer = @brewery.beers.create!(beer_params)
    redirect_to @brewery
  end

  def edit
    @brewery = Brewery.find(params[:brewery_id])
    @beer = @brewery.beers.find(params[:id])
  end

  def update
    @brewery = Brewery.find(params[:brewery_id])
    @beer = @brewery.beers.find(params[:id])
    @beer.update(beer_params)
    redirect_to @brewery
  end

  def destroy
    @brewery = Brewery.find(params[:brewery_id])

    @beer = Beer.find(params[:id])
    @beer.destroy
    redirect_to @brewery
  end
  private
  def beer_params
    params.require(:beer).permit(:name, :style, :abv, :photo_url, :brewery_id)

  end
end
