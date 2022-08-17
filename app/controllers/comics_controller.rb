class ComicsController < ApplicationController
  def index
  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = Comic.new(comic_params)
    if @comic.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comic = Comic.find(params[:id])
  end

  def edit
    @comic = Comic.find(params[:id])
  end

  private

  def comic_params
    params.require(:comic).permit(:title, :author, :volume, :target_age_id, :genre_id, :completion, :memo).merge(user_id: current_user.id)
  end
end
