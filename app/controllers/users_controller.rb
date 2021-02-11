class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
    redirect_to users_path, alert: '不正なアクセスです。あなたはこのユーザーではありません。' if @user != current_user
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '更新に成功しました'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
