class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  # Actionにはmemberとcolletionの種類が存在する。
  # memberは特定のfavoritesデータのidが必要
  # ex. show, edit, update, destroy
  # collectionは特定のfavoritesデータのidが不要
  # ex. index, new, create
  # tasks_path
  # edit_task_path(task)

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = '投稿をお気に入りに追加しました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    flash[:success] = '投稿のお気に入りを削除しました。'
    redirect_back(fallback_location: root_url)
  end
  
end  
