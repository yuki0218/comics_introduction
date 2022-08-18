class ComicsController < ApplicationController
  def index
    @comics = Comic.where.not(user_id: current_user.id).order("updated_at DESC")
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

  def update
    @comic = Comic.find(params[:id])
    if @comic.update(comic_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    comic = Comic.find(params[:id])
    comic.destroy
    redirect_to root_path
  end

  def search
    @comics = Comic.search(params[:title_word])
  end

  private

  def comic_params
    params.require(:comic).permit(:title, :author, :volume, :target_age_id, :genre_id, :completion, :memo).merge(user_id: current_user.id)
  end
end
