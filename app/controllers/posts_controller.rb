class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy, :show]
  before_action :move_to_indes, only: [:edit] 
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      Post.create(post_params)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      @post.update(post_params)
    else
      render :edit
    end

  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id)
  end 

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_indes
    redirect_to root_path unless user_signed_in? 
    if user_signed_in?
      redirect_to root_path unless @post.user.id == current_user.id
    end
  end 

end
