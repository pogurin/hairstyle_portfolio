class ResponseMailer < ActionMailer::Base

	def response_email(user, hairdresser, appointment)
    @user = user
    @hairdresser = hairdresser
    @appointment = appointment
    mail(from: @hairdresser.email,
    	 to: @user.email,
    	 :cc => "seiun340066@gamil.com",
    	 subject: '予約が受け付けられました！')
  	end
end