class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    @post = Post.where(id: params[:post_id]).first
  end

  def show
    @comment = Comment.find(params[:id])
    @post = Post.where(id: @comment.post_id).first
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to comment_path(@comment)
    else
      flash[:alert] = "problem!!! try again."
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to post_path
  end

  private

  def comment_params
  	params.require(:comment).permit(:id, :body, :user_id, :post_id, :comment)
  end

end
