class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update]  # Add a before_action to avoid duplication

  def index
    @popular_posts = Post.popular_posts
    @posts = Post::Paginatable.new(Post.order(id: :desc), {limit: params[:limit] || 10}).page(params[:page])
  end

  def show
    @post.with_lock do
      @post.increment!(:views)
    end
  end

  def new
    @post = Post.new
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
