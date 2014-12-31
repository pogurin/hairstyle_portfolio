class HairdressersController < ApplicationController
      helper_method :scrape_site

  def new
    @hairdresser = Hairdresser.new
  end

  def index
    if params[:search]
      @hairdressers = Hairdresser.where("LOWER(first_name) LIKE LOWER(?)", "%#{params[:search]}%")# SQL to allow us to search for part of the word and receive the matching patterns of words back
    else
      @hairdressers = Hairdresser.all
    end
    @coords = [] 
    @hairdressers.each do |r|
      @coords << {latitude: r.latitude.to_f, longitude: r.longitude.to_f, note: r.first_name + ' ' + r.last_name + ',' + ' ' + r.salon_address}
    end


  end

  def show 
    @hairdresser = Hairdresser.find(params[:id])
    if @hairdresser.available?
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

    respond_to do |format|
      if @hairdresser.update_attributes(params[:id])
        format.html { redirect_to(@hairdresser, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@hairdresser) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@hairdresser) }
      end  
    end  

    if @hairdresser.update_attributes(hairdresser_params)
      redirect_to hairdresser_path(@hairdresser)
    else
      render :edit
    end
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
    # puts(response)
    # puts(membership_id)
    # puts(response.index(membership_id))
    # puts ("----")
    if (response.index(membership_id)!=nil)
    
      index=response.index(membership_id)
      puts (response[index+1])
      if first_name==(response[index+1]) and last_name==(response[index+2])
       return true
      else
        return false
      end
    else
      return false
    end
   
    # membership_id = membership_id.integer
    # @response = { id: response[response.index(membership_id)], first_name: response[response.index(membership_id)+1], last_name: response[response.index(membership_id)+2] }
  
    
  end

  # def destroy only need to destroy session not hairdresser
  #   @hairdresser = Hairdresser.find(params[:id])
  #   @hairdresser.destroy
  #   redirect_to hairdressers_path
  # end

  private
  def hairdresser_params
    params.require(:hairdresser).permit(:first_name, :last_name, :career, :picture,:salon_address, :salon_url, :personal_message, :category_id, :email, :password, :password_confirmation, :status, :available, :member_ID)
  end



end








