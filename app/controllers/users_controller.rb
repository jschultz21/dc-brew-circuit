class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    if @user.save
      redirect_to breweries_path
    else
      flash[:alert] = "Please complete all fields"
      redirect_to new_user_path
    end

  end

  private
  def user_params
    params.require(:user).permit( :password, :name, :email)
  end

end
