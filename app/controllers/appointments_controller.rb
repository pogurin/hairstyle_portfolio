class AppointmentsController < ApplicationController
  
  before_action :authenticate_user!, only: [:index, :new, :create, :destroy]
  before_action :authenticate_hairdresser!, only: [:edit, :update]

  def index
    # 入力画面を表示
    @appointment = Appointment.new
    @hairdresser_first_name = Hairdresser.find(params[:hairdresser]).first_name
    @user_name = current_user.first_name
    render :action => 'index'
  end

  def new
    # 入力画面を表示
    @appointment = Appointment.new
    @hairdresser = Hairdresser.find(params[:hairdresser_id])
  end

 
  def create
    # 入力値のチェック
    @user = current_user
    @hairdresser = Hairdresser.find(params[:hairdresser_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.hairdresser_id = @hairdresser.id
    @appointment.user_id = current_user.id
    if @appointment.save
      # OK。確認画面を表示
      AppointmentMailer.received_email(@user, @hairdresser, @appointment).deliver
      render 'thanks'
    else
      # NG。入力画面を再表示
      render 'new'
    end
  end
 
  # def thanks
  #   # メール送信
  #   @hairdresser = Hairdresser.find(params[:hairdresser_id])
  #   @user = current_user
  #   AppointmentMailer.received_email(@user, @hairdresser, @appointment).deliver
    
  #   # 完了画面を表示
  #   render :action => 'thanks'
  # end

  def edit
    @hairdresser = Hairdresser.find(params[:hairdresser_id])
    @appointment = Appointment.find(params[:id])
  end

  # def update
  #   # hairdresser confirms and accepts appointment
  # end

  # def accept 
  #   @appointment = Appointment.new
  # end

  # def accept_thanks
  #   @appointment = 
  #   ResponseMailer.response_email(@appointment, current_user).deliver
  #   render :action => 'thanks'
  # end

  private
  def appointment_params
    params.require(:appointment).permit(:message)
  end 

end
