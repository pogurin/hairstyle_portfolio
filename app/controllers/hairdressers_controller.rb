# Add the mixin
require 'capybara_with_phantom_js'

class HairdressersController < ApplicationController
  
  def new
    @hairdresser = Hairdresser.new
  end

  def index
    @hairdressers = Hairdresser.all.order("created_at DESC")

  end

  def show 
    scrape_site
    @hairdresser = Hairdresser.find(params[:id])
    @available = ""
    if @hairdresser.available==true
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
    params.require(:hairdresser).permit(:first_name, :last_name, :career, :picture,:salon_address, :salon_url, :personal_message, :category_id, :email, :password, :password_confirmation,:status,:available)
  end

  def scrape_site
    Capybara.reset!
    visit "https://tmsportal.collegeoftrades.ca/web/ocot-public-services-v3/public-registry"
    fill_in('d_1332781491534', :with => '13943954')
    find_button('Find').click
    response = all 'span'.last
    response = response.text
    response = response.split(" ");
    @response = { id: response[response.index('13943954')], first_name: response[response.index('13943954')+1], last_name: response[response.index('13943954')+2] }
  end

end








