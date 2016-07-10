class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.all.sample(Brewery.all.length)
  end

  def show
    @brewery = Brewery.find(params[:id])
  end

  def brewery_params
    params.require(:brewery).permit(:name, :address, :latitude, :longitude, :photo_url, :logo_img, :description)
  end

end
