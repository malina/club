class Person::RegistrationsController < Devise::RegistrationsController
  
  before_filter :configure_permitted_parameters
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(
        :name,
        :phone,
        :email,
        :password,
        :password_confirmation,
        :confirm_conditions
      )
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(
        :name,
        :phone,
        :email,
        :password,
        :password_confirmation,
        :current_password,
        :confirm_conditions
      )
    end
  end
end
