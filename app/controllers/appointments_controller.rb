class AppointmentsController < ApplicationController
  before_filter :load_hairdresser

  def new
    @appointment = Appointment.new 
  end

  def show 
    @appointment = Appointment.find(params[:id]) # appointments build goes in create method
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def create 

    @appointment = @hairdresser.appointments.build(appointment_params)
    @appointment.hairdresser = current_hairdresser

      respond_to do |format|
      if @appointment.save
        format.html {redirect_to hairdresser_path(@hairdresser.id), notice: "Appointment created successfully"}
        format.js {} 
      else
        format.html {render "hairdressers/show", alert: "There was an error."}
        format.js {}  
      end
    end
    
  end

  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update_attributes(appointment_params)
      redirect_to hairdressers_path(@appointment)
    else
      render :edit
    end
  end

  def destroy 
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end

  private
  def appointment_params
    params.require(:appointment).permit(:appointment_at, :hairdresser_id, :message, :user_id, :appointment_date)
  end

  def load_hairdresser
    @hairdresser = Hairdresser.find(params[:hairdresser_id])
  end


end
