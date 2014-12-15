class HairdressersController < ApplicationController
  
  def new
    @hairdresser = Hairdresser.new
  end

  def index
    @hairdressers = Hairdresser.all.order("created_at DESC")
    @coords = [] 
    @hairdressers.each do |r|
      @coords << {latitude: r.latitude.to_f, longitude: r.longitude.to_f}
    end
    puts @coords.inspect
  end

  def show 
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

end








