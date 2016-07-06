class BeersController < ApplicationController


  def show
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.find(params[:id])
    @review = Review.new
  end

  def new
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.new
  end

  def create
    redirect_to root_path unless @current_user
    @brewery = Brewery.find(params[:brewery_id])
    @beer = @brewery.beers.create(beer_params)
    if @beer.save
      redirect_to @brewery
    else
      flash[:alert] = "Please include the beer's name and style"
      redirect_to new_brewery_beer_path
    end
  end

  def add_favorite
    @brewery = Brewery.find(params[:brewery_id])
    @beer = @brewery.beers.find(params[:id])
    @beer.favorites.create!(user: current_user)
    redirect_to brewery_beer_path(@brewery, @beer)
  end

  def remove_favorite
    @brewery = Brewery.find(params[:brewery_id])
    @beer = @brewery.beers.find(params[:id])
    @beer.favorites.where(user: current_user).destroy_all
    redirect_to brewery_beer_path(@brewery, @beer)
  end


  def edit

    redirect_to (root_path notice: "You cannot edit this beer") and return unless @current_user ==@beer.user
    @brewery = Brewery.find(params[:brewery_id])
    @beer = @brewery.beers.find(params[:id])
  end

  def update
    redirect_to root_path unless @current_user
    @brewery = Brewery.find(params[:brewery_id])
    @beer = @brewery.beers.find(params[:id])
    @beer.update(beer_params)
    if @beer.update(beer_params)
      redirect_to @brewery
    else
      flash[:alert] = "Please include the beer's name and style"
      redirect_to edit_brewery_beer_path
    end
  end


  def destroy
    redirect_to root_path unless @current_user
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
