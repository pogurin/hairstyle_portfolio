class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    p @user.valid?
    
    # respond_to do |format|
    # if @user.save
    #   format.html do
    #     auto_login(@user)
    #     redirect_to user_path(current_user)
    #   end
    # else
    #   p @user.errors
    #   render 'new'
    # end
  end

  def update
    

    if @user.update_attributes!(user_params)
      puts "it saved ----------------------------"
      redirect_to user_path(current_user)
    else
      puts "it failed ----------------------------"
      redirect_to user_path(current_user)
    end
  end

  def edit
  end

  private
  def user_params
    params.require(:user)
          .permit(:first_name,
                  :last_name,
                  :email,
                  :picture,
                  :picture_cache,
                  :password,
                  :password_confirmation)
  end
end
