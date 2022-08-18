class UsersController < ApplicationController
  def index
    @comics = Comic.where(user_id: current_user.id)
  end

  def show
    @comics = Comic.where(user_id: params[:id])
    @user = User.find(params[:id])
  end
end
