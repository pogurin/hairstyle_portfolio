class InquiryMailer < ActionMailer::Base
     # 送信元アドレス
  def received_email(inquiry, user)
    @inquiry = inquiry
    mail(from: user.email,
    	 to: @inquiry.hairdresser_email,
    	:subject => 'Thank you for your message!')
  end
 
end