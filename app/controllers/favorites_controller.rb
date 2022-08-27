class FavoritesController < ApplicationController
  before_action :comic_params, only: [:create, :destroy]

  def create
    @favorite = Favorite.create(user_id: current_user.id, comic_id: @comic.id)
    # redirect_back fallback_location: root_path
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, comic_id: @comic.id)
    @favorite.destroy
    # redirect_back fallback_location: root_path
  end

  private

  def comic_params
    @comic = Comic.find(params[:comic_id])
  end
end