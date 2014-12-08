class HairdresserSessionsController < ApplicationController
	def new
  end

  def create #capturing the password and matching it to the user.
  	hairdresser = Hairdresser.find_by(email: params[:email]) #.find only looks up id's so you need find by email to find by a string
    if hairdresser && hairdresser.authenticate(params[:password])
      session[:current_hairdresser_id] = hairdresser.id #this logs us in
      redirect_to hairdressers_url, notice: "Logged in!"
    else
    	flash.now[:alert] = "invalid email or password"
      render "new"
    end
  end

  def destroy
  	session[:hairdresser_id] = nil
  	redirect_to pictures_url, notice: "Logged out"
  end
end
