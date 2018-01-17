class PostsController < ApplicationController
  
  before_action :require_login, except: [:show]
  
  def show
    @post = Post.find(params[:id])
    @post_all_comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to subs_url
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
  
end
