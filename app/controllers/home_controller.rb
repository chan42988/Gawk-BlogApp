class HomeController < ApplicationController
  def index
    @home = User.all
  end

  def show
    @home = Home.find(params[:id])
    @post = @user.posts
  end

  def new
  end

  def create
    @home = Home.create(user_params)

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
