class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Created."
      redirect_to posts_path
    else
      flash[:alert] = "problem!!! try again."
      redirect_to :back
    end
  end

  def destroy
    @user = Comment.destroy(params[:id])
    redirect_to posts_path
  end

  private

  def comment_params
  	params.require(:comment).permit(:body, :user_id, :post, :comment)
  end

end
