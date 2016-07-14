class FavoriteBeersController < ApplicationController
  before_action :authenticate_user!

  def index
    @beers = current_user.favorite_beers
  end

  def create

    @beer = Beer.find(params[:beer_id])
    @brewery = @beer.brewery
    @favorite = Favorite.create(favorited: @beer, user: current_user)
    @favorite.beer_id = @beer.id # NHO: is this line necessary?
      if @favorite.save
      redirect_to brewery_beer_path(@brewery, @beer), notice: 'Beer has been favorited'
    else
      redirect_to @beer
    end
  end

  def destroy
    @beer = Beer.find(params[:id])
    @brewery = @beer.brewery
    Favorite.where(favorited_id: @beer.id, user_id: current_user.id).first.destroy
    redirect_to brewery_beer_path(@brewery, @beer), notice: 'Beer is no longer in favorites'
  end
end
