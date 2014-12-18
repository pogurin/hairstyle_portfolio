<<<<<<< HEAD
# 1. user gets page /hairdressers/5
# 2. rails runs: controller = HairdressersController.new(http_request)
# 3. rails runs: controller.show
# 4. rails runs: controller.render("show")
# 5. rails throws away controller

=======
# Add the mixin
require 'capybara_with_phantom_js'
>>>>>>> 405e5487d3b0c5b2c0ce52a3350649cb15dcc876

class HairdressersController < ApplicationController
  
  def new
    @hairdresser = Hairdresser.new
  end

  def index
    @hairdressers = Hairdresser.all.order("created_at DESC")
    @coords = [] 
    @hairdressers.each do |r|
      @coords << {latitude: r.latitude.to_f, longitude: r.longitude.to_f, note: r.first_name + ' ' + r.last_name + ',' + ' ' + r.salon_address}
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show 
    
    @hairdresser = Hairdresser.find(params[:id])
<<<<<<< HEAD

    if @hairdresser.available?
=======
    @hairdresser.verified = scrape_site(@hairdresser.first_name,@hairdresser.last_name,@hairdresser.member_ID.to_s)

    @available = ""
    if @hairdresser.available==true
>>>>>>> 405e5487d3b0c5b2c0ce52a3350649cb15dcc876
      @available = "Available"
    else
      @available = "Not available"
    end

    if current_user
      @review = @hairdresser.reviews.build
    end
  end


  def edit
    @hairdresser = Hairdresser.find(params[:id])
  end

  def create 
    @hairdresser = Hairdresser.new(hairdresser_params)
    if @hairdresser.save
      flash[:notice] = "Signed up" # sinonymous to :notice = "Signed up"
      session[:hairdresser_id] = @hairdresser.id #to also log in after we have signed up
      redirect_to hairdressers_url
    else
      render :new
    end
  end

  def update
    @hairdresser = Hairdresser.find(params[:id])

    if @hairdresser.update_attributes(hairdresser_params)
      redirect_to hairdresser_path(@hairdresser)
    else
      render :edit
    end
  end


  # def destroy only need to destroy session not hairdresser
  #   @hairdresser = Hairdresser.find(params[:id])
  #   @hairdresser.destroy
  #   redirect_to hairdressers_path
  # end

  private
  def hairdresser_params
<<<<<<< HEAD
    params.require(:hairdresser).permit(:appointment_at,:first_name, :last_name, :career, :picture,:salon_address, :salon_url, :personal_message, :category_id, :email, :password, :password_confirmation, :status, :available)
=======
    params.require(:hairdresser).permit(:first_name, :last_name, :career, :picture,:salon_address, :salon_url, :personal_message, :category_id, :email, :password, :password_confirmation, :status, :available, :member_ID)
  end

  def scrape_site(first_name,last_name,membership_id)
    if (membership_id=='')
      return false
    end
     if (membership_id==[])
      return false
    end
    Capybara.reset!
    visit "https://tmsportal.collegeoftrades.ca/web/ocot-public-services-v3/public-registry"
    fill_in('d_1332781491534', :with => membership_id)
    find_button('Find').click
    response = all 'span'.last
    response = response.text
    response = response.split(" ");
    puts ("CONSOLE LOG")
    puts(response)
    puts(membership_id)
    index=response.index(membership_id)
    puts (response[index+1])
    # membership_id = membership_id.integer
    # @response = { id: response[response.index(membership_id)], first_name: response[response.index(membership_id)+1], last_name: response[response.index(membership_id)+2] }
    if first_name==(response[index+1]) and last_name==(response[index+2])
      return true
    else
      return false
    end
>>>>>>> 405e5487d3b0c5b2c0ce52a3350649cb15dcc876
  end

end








