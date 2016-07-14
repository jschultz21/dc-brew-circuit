class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def new
    redirect_to root_path unless current_user
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.find(params[:beer_id])
    @review = Review.new
  end

  def create
    redirect_to root_path unless current_user
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.find(params[:beer_id])
    @review = @beer.reviews.create(review_params)
    @review.user = @current_user
    if @review.save
      redirect_to brewery_beer_path(@brewery, @beer)
    else
      redirect_to(brewery_beer_path(@brewery,@beer), notice: "Can't submit an empty review!") and return
    end
    # NHO: this block is unnecessary due to line 11
    unless current_user == @review.user
      redirect_to(root_path, notice: "Sign in to add a review") and return
    end
  end

  def edit
    redirect_to root_path unless current_user
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.find(params[:beer_id])
    @review = Review.find(params[:id])
    # NHO: this block is unnecessary due to line 28
    unless current_user == @review.user
      redirect_to(root_path, notice: "You cannot edit this review") and return
    end
  end

  def update
    redirect_to root_path unless current_user
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.find(params[:beer_id])
    @review = Review.find(params[:id])
    @review.save(review_params)
    if @review.save
      redirect_to brewery_beer_path(@brewery, @beer)
    else
      redirect_to(brewery_beer_path(@brewery,@beer), notice: "Can't submit an empty review!") and return
    end
    # NHO: this block is unnecessary due to line 39
    unless current_user == @review.user
      redirect_to(root_path, notice: "Sign in to add a review") and return
    end
  end

  def destroy
    @beer = Beer.find(params[:beer_id])
    @brewery = Brewery.find(params[:brewery_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to brewery_beer_path(@brewery, @beer)    
    unless current_user == @review.user # NHO: need to move this block to the top of this method
      redirect_to(root_path, notice: "You cannot delete this review") and return
    end
  end

  private
  def review_params
    params.require(:review).permit(:user_id, :body)
  end
end
