class UsersController < ApplicationController
  def index
    @comics = Comic.where(user_id: current_user.id).includes(:user)
  end

  def show
    @comics = Comic.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def good
    favorites = Favorite.where(user_id: current_user.id).pluck(:comic_id)
    @comics = Comic.find(favorites)
  end
end
