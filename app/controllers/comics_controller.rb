class ComicsController < ApplicationController
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :create_comic, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
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

  def move_to_index
    if current_user.id != Comic.find(params[:id]).user_id
      redirect_to root_path
    end
  end

  def create_comic
    @comic = Comic.find(params[:id])
  end
end
