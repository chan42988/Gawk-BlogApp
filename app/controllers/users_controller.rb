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
        redirect_to new_user_path
      else
        flash[:alert] = "There was a problem saving your account."
        redirect_to new_user_path
      end

  end

  def update

  end

  def destroy
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end


end



