class ComicsController < ApplicationController
  def index
    @comics = Comic.where.not(user_id: current_user.id).order("updated_at DESC").includes(:user)
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
    if params[:title_word] != nil
      @comics = Comic.search_title(params[:title_word]).where.not(user_id: current_user.id).includes(:user)
    else
      @comics = Comic.search_genre(params[:target_age], params[:genre]).where.not(user_id: current_user.id).includes(:user)
    end
  end

  private

  def comic_params
    params.require(:comic).permit(:title, :author, :volume, :target_age_id, :genre_id, :completion, :memo).merge(user_id: current_user.id)
  end
end
