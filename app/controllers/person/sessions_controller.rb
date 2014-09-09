class Person::SessionsController < Devise::SessionsController
  helper_method :failed_login?
  
  def failed_login?
    (options = env["warden.options"]) && options[:action] == "unauthenticated"
  end 
end
