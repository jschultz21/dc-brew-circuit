class FavoriteBeersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_beer_and_brewery, except: [:index]

  def index
    @beers = current_user.favorite_beers
  end

  def create
    if Favorite.create(favorited: @beer, user: current_user)
      redirect_to brewery_beer_path(@brewery, @beer), notice: 'Beer has been favorited'
    else
      redirect_to @beer
    end
  end


  def destroy

    Favorite.where(favorited_id: @beer.id, user_id: current_user.id).first.destroy
    redirect_to brewery_beer_path(@brewery, @beer), notice: 'Beer is no longer in favorites'
  end

  private
  def set_beer_and_brewery
    @beer = Beer.find(params[:id])
    @brewery = @beer.brewery
  end
end
