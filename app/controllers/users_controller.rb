class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  skip_before_action :login_required, only: [:new, :create ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), notice: "登録しました"
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
  end

  def favorites
    @user = User.find(current_user.id)
    @photos = @user.photos

    favorites = Favorite.where(user_id: current_user.id).pluck(:photo_id)
    @favorite_list = Photo.find(favorites)
  end

  def edit
    redirect_to user_path(@user.id) unless current_user.id == @user.id
  end

  def update
    if current_user.id == @user.id
      if @user.update(user_params)
        redirect_to user_path(@user.id), notice: "画像を変更しました"
      else
        redirect_to user_path(@user.id)
      end
    else
      redirect_to  user_path(@user.id)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
