class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.new(username: params[:user][:username], password: params[:user][:password], email: params[:user][:email])


      if @user.save
        flash[:notice] = "Your account was created successfully."
        redirect_to user_path @user
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
end
