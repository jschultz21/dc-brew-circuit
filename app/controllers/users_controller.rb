class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to breweries_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :name, :email)
  end

end
