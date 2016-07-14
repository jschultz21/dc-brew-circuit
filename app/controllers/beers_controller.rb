class BeersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  # NHO: what lines are repetitive in this controller?
  # You could use a before_action to DRY up the code by writing a method like find_brewery
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
    # NHO: careful of the order here, currently this will still destroy the beer, and then redirect them
    unless current_user == @beer.user# NHO: we need to move this block to the first line of this action
      redirect_to(root_path, notice: "You cannot edit this beer") and return
      @brewery = Brewery.find(params[:brewery_id])
    end
  end

  def destroy
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.find(params[:id])
    @beer.destroy
    redirect_to @brewery

    # NHO: careful of the order here, currently this will still destroy the beer, and then redirect them
    unless current_user == @beer.user # NHO: we need to move this block to the first line of this action
      redirect_to (root_path notice: "You cannot delete this beer") and return
    end
  end

  private
  def beer_params
    params.require(:beer).permit(:name, :style, :abv, :photo_url, :brewery_id)
  end
end
