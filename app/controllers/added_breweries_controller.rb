class AddedBreweriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @breweries = current_user.added_breweries
  end

  def create
    @brewery = Brewery.find(params[:brewery_id])
    @add = Add.create(added: @brewery, user: current_user)
    @add.brewery_id = @brewery.id # NHO: is this line necessary?
    if @add.save
      redirect_to @brewery, notice: 'added to your route!'
    else
      redirect_to @brewery # NHO: could display a notice saying it was unsuccessful...
    end
  end

  def destroy
    @brewery = Brewery.find(params[:id])
    @add = Add.where(added_id: @brewery.id, user: current_user).first.destroy
    if @add.destroy
      redirect_to @brewery, notice: 'removed from your route!'
    else
      redirect_to @brewery
    end
  end
end
