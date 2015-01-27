class RejectMailer < ActionMailer::Base

	def reject_email(user, hairdresser, appointment)
    @user = user
    @hairdresser = hairdresser
    @appointment = appointment
    mail(from: @hairdresser.email,
    	 to: @user.email,
    	 :cc => "seiun340066@gamil.com",
    	 subject: 'ごめんなさい。今回はキャンセルさせて下さい。')
  	end
end 