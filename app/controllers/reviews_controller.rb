class ReviewsController < ApplicationController

  def new
    @brewery = Brewery.find(params[:brewery_id])
    @beer = Beer.find(params[:beer_id])
    @review = Review.new
end

def create
  @brewery = Brewery.find(params[:brewery_id])
  @beer = Beer.find(params[:beer_id])
  @review = @beer.reviews.create!(review_params)
  redirect_to brewery_beer_path(@brewery,@beer)
end


private
def review_params
  params.require(:review).permit(:author, :body)

end

end
