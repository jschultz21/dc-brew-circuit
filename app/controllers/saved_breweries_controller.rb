class SavedBreweriesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @breweries = current_user.saved_breweries
  end

  def create
    @brewery = Brewery.find(params[:brewery_id])
    if Save.create (saved: @brewery, user: current_user)
      redirect_to brewery_path(@brewery), notice: 'Added to Route!'

    else
      redirect_to @brewery
    end
  end

end
