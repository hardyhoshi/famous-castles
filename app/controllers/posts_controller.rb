class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: '投稿に成功しました。'
    else
      render :new
    end
  end

  def edit
    redirect_to posts_path, alert: '不正なアクセスです。あなたはこのユーザーではありません。' if @post.user != current_user
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '更新に成功しました'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :body, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
