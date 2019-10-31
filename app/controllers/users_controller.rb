class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    user.save
    flash[:success] = "Successfully saved!"
  end
end
