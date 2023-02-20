class FavoritesController < ApplicationController
  before_action :set_photo

  def create
    @favorite = Favorite.create(user_id: current_user.id, photo_id: @photo.id )
    redirect_to photo_path(@photo.id), notice: "「いいね」をしました"
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, photo_id: @photo.id )
    @favorite.destroy
    redirect_to photo_path(@photo.id), notice: "「いいね」を解除しました"
  end

  private
  def set_photo
    @photo = Photo.find(params[:photo_id])
  end
end
