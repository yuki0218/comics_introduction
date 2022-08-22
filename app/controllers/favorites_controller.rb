class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.create(user_id: current_user.id, comic_id: params[:comic_id])
    redirect_back fallback_location: root_path
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, comic_id: params[:comic_id])
    @favorite.destroy
    redirect_back fallback_location: root_path
  end
end