class Admin::PostsController < ApplicationController
  include ActiveStorage::SetCurrent
  
  before_action :require_admin
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
    # @post is already set by set_post
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_url, notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :title_description, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def require_admin
    raise ActiveRecord::RecordNotFound unless current_user&.admin?
  end
end
