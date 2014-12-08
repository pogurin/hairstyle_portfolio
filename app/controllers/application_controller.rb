class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_hairdresser
    @current_hairdresser ||= Hairdresser.find(session[:hairdresser_id]) if session[:hairdresser_id]
  end

  helper_method :current_hairdresser

  def ensure_logged_in
    unless current_hairdresser
      flash[:alert] = "Please log in"
      redirect_to new_session_path
    end
  end
end
