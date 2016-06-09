class UsersController < ApplicationController
  def index
    @users = User.all.reverse
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).reverse
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

      if @user.save
        flash[:notice] = "Your account was created successfully."
        redirect_to user_path(@user)
      else
        flash[:alert] = "There was a problem saving your account."
        redirect_to home_index_path
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Updated successfully"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Update failed"
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).delete
    redirect_to users_path
    flash[:alert] = "Bye Bye"
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end
