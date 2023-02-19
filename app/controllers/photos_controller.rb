class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      PostMailer.post_mail(@photo).deliver
      redirect_to photos_path, notice: "登録しました"
    else
      render :new, notice: "登録エラーです"
    end
  end

  def index
    @photos = Photo.all
  end

  def show
  end

  def edit
  end

  def update
    if current_user.id == @photo.user.id
      if @photo.update
        redirect_to photos_path, notice: "編集しました"
      else
        render :edit, notice: "編集エラーです"
      end
    else
      redirect_to photos_path
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_path, notice: "投稿を削除しました"
  end

  private
  def photo_params
    params.require(:photo).permit(:image, :text, :image_cache )
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

end
