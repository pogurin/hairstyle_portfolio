module CapybaraWithPhantomJs
  include Capybara
 
  # Create a new PhantomJS session in Capybara
  def new_session
 
    # Register PhantomJS (aka poltergeist) as the driver to use
    Capybara.register_driver :poltergeist do |app|
      Capybara::Poltergeist::Driver.new(app)
    end
 
    # Use XPath as the default selector for the find method
    Capybara.default_selector = :xpath
 
    # Start up a new thread
    @session = Capybara::Session.new(:poltergeist)
 
    # Report using a particular user agent
    @session.driver.headers = { 'User-Agent' =>
      "Mozilla/5.0 (Macintosh; Intel Mac OS X)" }
 
    # Return the driver's session
    @session
  end
 
  # Returns the current session's page
  def html
    session.html
  end
end