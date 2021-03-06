class PostsController < ApplicationController
  before_action :authenticate_user!,  except: [:index, :show]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path, notice:"Publicación exitosa"
    else
      render:new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to posts_path, notice: "La publicación se ha modificado exitosamente"
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path, notice: "La publicación se ha eliminado exitosamente"

  end

  private
    def post_params
      params.require(:post).permit(:title, :published_for, :description)
    end


end
