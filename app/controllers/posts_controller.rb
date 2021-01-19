class PostsController < ApplicationController
  def index
    @post = Post.all
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

  private

  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id)
  end 


end
