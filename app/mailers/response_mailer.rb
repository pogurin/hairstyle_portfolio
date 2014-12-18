class ResponseMailer < ActionMailer::Base

	def response_email(user, hairdresser, appointment)
    @user = user
    @hairdresser = hairdresser
    @appointment = appointment
    mail(from: @hairdresser.email,
    	 to: @user.email,
    	 subject: 'Response was accepted')
  	end
end