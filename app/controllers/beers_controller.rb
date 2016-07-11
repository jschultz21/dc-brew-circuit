class BeersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.find(params[:id])
    @review = Review.new
  end

  def new
    redirect_to root_path unless current_user
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.new
  end

  def create
    redirect_to root_path unless current_user
    @brewery = Brewery.find(params[:brewery_id])
    @beer = @brewery.beers.create(beer_params)
    @beer.user_id = current_user.id
    if @beer.save
      redirect_to @brewery
    else
      flash[:alert] = "Please include the beer's name and style"
      redirect_to new_brewery_beer_path
    end
    unless current_user == @beer.user
      redirect_to(root_path, notice: "Sign in to add a beer") and return
    end
  end

  def edit
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.find(params[:id])
    unless current_user == @beer.user
      redirect_to(root_path, notice: "You cannot edit this beer") and return
    end
  end

  def update
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.find(params[:id])
    @beer.update(beer_params)
    if @beer.save(beer_params)
      redirect_to @brewery
    else
      flash[:alert] = "Please include the beer's name and style"
      redirect_to edit_brewery_beer_path
    end
    unless current_user == @beer.user
      redirect_to(root_path, notice: "You cannot edit this beer") and return
      @brewery = Brewery.find(params[:brewery_id])
    end
  end

  def destroy
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.find(params[:id])
    @beer.destroy
    redirect_to @brewery

    unless current_user.id == @beer.user.id
      redirect_to (root_path notice: "You cannot delete this beer") and return
    end
  end

  private
  def beer_params
    params.require(:beer).permit(:name, :style, :abv, :photo_url, :brewery_id)

  end
end
