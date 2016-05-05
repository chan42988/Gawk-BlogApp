class SessionsController < ApplicationController
  def create 
  	@user = User.where(email: params[:email]).first
  	if @user && @user.password == (params[:password])
  		session[:user_id] = @user.id
  		flash[:alert] = "blah blah"
  		redirect_to user_path(@user)
  	else
  		flash[:alert] = "blah blah"
  		redirect_to root_path
  	end 	
  end

  def destroy
  end

  def new
  end
end
