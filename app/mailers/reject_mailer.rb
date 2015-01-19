class RejectMailer < ActionMailer::Base

	def reject_email(user, hairdresser, appointment)
    @user = user
    @hairdresser = hairdresser
    @appointment = appointment
    mail(from: @hairdresser.email,
    	 to: @user.email,
    	 :cc => "seiun340066@gamil.com",
    	 subject: 'Sorry,Response was Rejected')
  	end
end 