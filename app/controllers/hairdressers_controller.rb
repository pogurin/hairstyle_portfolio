class HairdressersController < ApplicationController
    
    helper_method :scrape_site
    respond_to :html, :json

  def new

    @hairdresser = Hairdresser.new
    @appointment = Appointment.new

  end

  def index

    @hairdressers = Hairdresser.all.order("created_at DESC")
    @coords = [] 
    @hairdressers.each do |r|
      if r.latitude != nil
      @coords << {latitude: r.latitude.to_f, longitude: r.longitude.to_f, note: r.first_name + ' ' + r.last_name + ',' + ' ' + r.salon_address}
     end
    end

  end

  def show 

    @hairdresser = Hairdresser.find(params[:id])
    @appointments = @hairdresser.appointments

    @pictures = Hairdresser.find(params[:id]).pictures.order("created_at DESC")
    # @pictures = Hairdresser.find(params[:id]).pictures.all.order("created_at DESC")


    if @hairdresser.available?
      @available = "Available"
    else
      @available = "Not available"
    end

    if current_user
      @review = @hairdresser.reviews.build
    end
    if current_hairdresser
      @appointment = @hairdresser.appointments.build
    end
    

    @dates = Array.new

    for i in 0..7
      @dates[i]=Date.today + i
    end

    @coords = [] 
    if @hairdresser.latitude!=nil

    @coords << {latitude: @hairdresser.latitude.to_f, longitude: @hairdresser.longitude.to_f, note: @hairdresser.first_name + ' ' + @hairdresser.last_name + ',' + ' ' + @hairdresser.salon_address}
    
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
    @hairdresser.update_attributes(hairdresser_params)
    respond_with @hairdresser
    # if @hairdresser.update_attributes(hairdresser_params)
    #       respond_with @hairdresser
    # else
    #   format.html { render :action => "edit" }
    # end
    
  #   if hairdresser_params != nil
  #   @hairdresser.update_attributes(hairdresser_params)
  # end
   
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
  end





  private
  def hairdresser_params

    params.require(:hairdresser).permit(:first_name, :last_name, :career, 
      :picture,:salon_address, :salon_url, :personal_message, :category_id, :email, 
      :password, :password_confirmation, :status, :available, :member_ID, :area, :price, :style, 
      :perm_price, :cut_price, :treatment_price,:name)
    

  end


end








