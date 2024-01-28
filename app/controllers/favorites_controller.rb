class FavoritesController < ApplicationController
  def create
    @micropost = Micropost.find(params[:id])
    Favorite.create(user_id: current_user.id, micropost_id: @micropost.id)
    # redirect_back(fallback_location: root_path)  #ここを削除！
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    Favorite.find_by(user_id: current_user.id, micropost_id: @micropost.id).destroy
    # redirect_back(fallback_location: root_path)  #ここを削除！
  end
end
