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
    @hairdresser = Hairdresser.new

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
end
