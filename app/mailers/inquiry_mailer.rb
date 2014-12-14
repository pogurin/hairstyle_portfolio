class InquiryMailer < ActionMailer::Base
  default from: "seiun340066@gmail.com"   # 送信元アドレス
  default to: "seiun340066@gmail.com"     # 送信先アドレス
 
  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'Thank you for your message!')
  end
 
end