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
    if current_user
     @user = current_user
    end
    if current_hairdresser
      @hairdresser = current_hairdresser
    end

    if @appointment.update_attributes(appointment_params)
      redirect_to hairdresser_path(@hairdresser)
      AppointmentMailer.received_email(@user, @hairdresser, @appointment).deliver
    else
      render :edit
    end


  end

   def update_reject
    @hairdresser = Hairdresser.find(params[:hairdresser_id])
    raise "You bad man" unless current_hairdresser == @hairdresser
    # raise is security function.
    @appointment = Appointment.find(params[:id])
    @appointment.confirmed_at = Time.now 
    RejectMailer.reject_email(@appointment.user, @hairdresser, @appointment).deliver
  end

  
  def update_accept
    @hairdresser = Hairdresser.find(params[:hairdresser_id])
    raise "You bad man" unless current_hairdresser == @hairdresser
    # raise is security function.
    @appointment = Appointment.find(params[:id])
    @appointment.confirmed_at = Time.now 
    ResponseMailer.response_email(@appointment.user, @hairdresser, @appointment).deliver
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
