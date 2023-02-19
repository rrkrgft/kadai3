class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to photos_path, notice: "登録しました"
    else
      render :new
    end
  end

  def index
    @photos = Photo.all
  end

  def show
  end

  def edit
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :text, :image_cache )
  end

end
