# frozen_string_literal: true

class PostsController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @pagy, @posts = pagy(Post.all)
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Article was created successfuly'
    else
      flash.now[:danger] = 'Article was not created'
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, success: 'Article was updated successfuly'
    else
      flash.now[:danger] = 'Article was not updated'
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Article was deleted successfuly'
  end

  private

  def set_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags, :category_id, :user_id)
  end
end
