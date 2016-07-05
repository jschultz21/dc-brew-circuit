class ReviewsController < ApplicationController

  def new
    redirect_to root_path unless @current_user
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.find(params[:beer_id])
    @review = Review.new
end

def create
  redirect_to root_path unless @current_user
  @brewery = Brewery.find(params[:brewery_id])
  @beer = Beer.find(params[:beer_id])
  @review = @beer.reviews.create!(review_params)
  redirect_to brewery_beer_path(@brewery,@beer)
end

def edit
  redirect_to root_path unless @current_user
  @review = Review.find(params[:id])
end

def update
  redirect_to root_path unless @current_user
  @review = Review.find(params[:id])
  @review.update(reivew_params)
end

def destroy
  redirect_to root_path unless @current_user
  @review = Review.find(params[:id])
  @review.destroy
  redirect_to brewery_beer_path(@brewery, @beer)
end


private
def review_params
  params.require(:review).permit(:author, :body)

end

end
