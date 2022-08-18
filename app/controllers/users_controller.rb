class UsersController < ApplicationController
  def index
    @comics = Comic.where(user_id: current_user.id)
  end

  def show
  end
end
