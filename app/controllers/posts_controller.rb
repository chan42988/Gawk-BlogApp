class PostsController < ApplicationController

  def index
    @posts = Post.all.reverse
  end

  def create
    current_user
  	@post = Post.new(post_params)
    @post.save
    redirect_to posts_path(@post)
  end

  def new
    current_user
    @post = Post.new
    @comment = Comment.new
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def show
    current_user
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = Comment.where(post_id: params[:id])
    @comment = Comment.new
  end

  def update
  	@post = Post.find(params[:id])
  	@post.update(post_params)
  	redirect_to post_path(@post)
  end

  def destroy
  	@user = Post.destroy(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end