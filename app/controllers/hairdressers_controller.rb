class HairdressersController < ApplicationController
  
  def new
    @hairdresser = Hairdresser.new
  end

  def show 
    @hairdresser = Hairdresser.find(params[:id])
  end

  def edit
    @hairdresser = Hairdresser.find(params[:id])
  end

  def create 
    @hairdresser = Hairdresser.new(hairdresser_params)

    if @hairdresser.save
      redirect_to hairdressers_url
    else
      render :new
    end
  end

  def update
    @hairdresser = Hairdresser.find(params[:id])

    if @hairdresser.update_attributes
      redirect_to hairdresser_path(@hairdresser)
    else
      render :edit
    end
  end

  def destroy 
    @hairdresser = Hairdresser.find(params[:id])
    @hairdresser.destroy
    redirect_to hairdressers_path
  end

  private
  def hairdresser_params
    params.require(:hairdresser).permit(:first_name, :last_name, :career, :salon_address, :salon_url, :personal_message)
  end








