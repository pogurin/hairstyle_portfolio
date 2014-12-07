class UserSessionsController < ApplicationController
  def new
  end

  def create
  	if @user = login(params[:email],params[:password],params[:remember_me])
  	  redirect_back_or_to(root_url, notice: 'Login successful')
  	else
  		flash.now[:alert] = "Login failed"
  		render 'new'
    end
  end

  def destroy
    logout
    redirect_to pictures_path, notice: "Logged out!"
  end

end