class PostsController < ApplicationController
  #before_filter :authenticate_user!
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params[:post])
    if @post.save!
      redirect_to posts_index_path
    else
      redirect_to new_post_path
    end


  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    if @post.save!
      redirect_to posts_index_path
    else
      redirect_to edit_post_path(@post)
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_index_path
  end

end
