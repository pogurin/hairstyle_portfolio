class InquiryController < ApplicationController
  def index
    # 入力画面を表示
    @inquiry = Inquiry.new
    @inquiry.hairdresser_email = Hairdresser.find(params[:hairdresser]).email

    @inquiry.hairdresser_first_name = Hairdresser.find(params[:hairdresser]).first_name
    @inquiry.name = current_user.first_name
    render :action => 'index'

  end
 
  def confirm
    # 入力値のチェック
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.name = current_user.first_name
    if @inquiry.valid?
      # OK。確認画面を表示
      render :action => 'confirm'
    else
      # NG。入力画面を再表示
      render :action => 'index'
    end
  end
 
  def thanks
    # メール送信
  
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.name = current_user.first_name
   
    InquiryMailer.received_email(@inquiry, current_user).deliver
    
    # 完了画面を表示
    render :action => 'thanks'
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :hairdresser_email, :message,:hairdresser_first_name)
  end 

end
