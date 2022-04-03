class FavoritesController < ApplicationController
  def create
    Favorite.create(user_id: current_user.id, micropost_id: params[:id])
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, micropost_id: params[:id]).destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end
end
