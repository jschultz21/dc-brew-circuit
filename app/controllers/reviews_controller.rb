class ReviewsController < ApplicationController

  def new
    redirect_to root_path unless @current_user
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.find(params[:beer_id])
    @review = Review.new
  end

  def create
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.find(params[:beer_id])
    @review = @beer.reviews.create!(review_params)
    @review.user = @current_user
    redirect_to brewery_beer_path(@brewery, @beer)
  end

  def edit
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.find(params[:beer_id])
    @review = Review.find(params[:id])
    unless current_user == @review.user
      redirect_to(root_path, notice: "You cannot edit this review") and return
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
    redirect_to root_path unless @current_user
    @beer = Beer.find(params[:beer_id])
    @brewery = Brewery.find(params[:brewery_id])
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to brewery_beer_path(@brewery, @beer)
  end

  def destroy
    @beer = Beer.find(params[:beer_id])
    @brewery = Brewery.find(params[:brewery_id])
    redirect_to root_path unless @current_user
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to brewery_beer_path(@brewery, @beer)
  end

  private
  def review_params
    params.require(:review).permit(:user_id, :body)
  end
end
