class SessionsController < ApplicationController
  def create 
  	user = User.find_by(email: params[:sessions][:email])

  	if user && user.password == (params[:sessions][:password])
  		log_in user
  		flash[:alert] = "you are signed in as #{current_user}"
  		redirect_to user
  	else
  		flash[:alert] = "wrong password or email"
  		render 'new'
  	end 	
  end

  def destroy
    session.clear
    redirect_to home_index_path
    flash[:alert] = "you are signed out"
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end
