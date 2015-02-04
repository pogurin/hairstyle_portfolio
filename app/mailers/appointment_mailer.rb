class AppointmentMailer < ActionMailer::Base
     # 送信元アドレス
  def received_email(user, hairdresser, appointment)
    # @url = 'appointment_accept_url'
    @user = user
    @hairdresser = hairdresser
    @appointment = appointment
    if @appointment.file.present?
      attachments["#{@appointment.file.original_filename}"] = @appointment.file.read
    end
    @url = edit_hairdresser_appointment_url(@hairdresser, @appointment)
    mail(from: @user.email,
    	 to: @hairdresser.email,
        # :cc => "seiun340066@gamil.com",
    	:subject => '予約を受け付けました!')
  end

end

