class ApplicationController < ActionController::Base
 
  include HttpAcceptLanguage::AutoLocale
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :scrape_site
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name,:last_name,:career,:salon_address,:salon_url,:personal_message,:member_ID]
  end  

  def scrape_site(first_name,last_name,membership_id)
    if (membership_id=='')
      return false
    end
     if (membership_id==[])
      return false
    end
    Capybara.reset!
    visit "https://tmsportal.collegeoftrades.ca/web/ocot-public-services-v3/public-registry"
    fill_in('d_1332781491534', :with => membership_id)
    find_button('Find').click
    response = all 'span'.last
    response = response.text
    response = response.split(" ");
    puts ("CONSOLE LOG")
    # puts(response)
    # puts(membership_id)
    # puts(response.index(membership_id))
    # puts ("----")
    if (response.index(membership_id)!=nil)
      index=response.index(membership_id)
      puts (response[index+1])
      if first_name==(response[index+1]) and last_name==(response[index+2])
       return true
      else
        return false
      end
    else
      return false
    end
   
    
  end
end
