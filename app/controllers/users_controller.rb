class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def destroy
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:picture,:password,:password_confirmation, [:_destroy])
  end
end
