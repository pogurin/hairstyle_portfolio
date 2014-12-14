class ResponseMailer < ActionMailer::Base

	def response_email(inquiry,user)
    @inquiry = inquiry
    mail(from: @inquiry.hairdresser_email,
    	 to: user.email,
    	:subject => 'Response was accepted')
  	end
end