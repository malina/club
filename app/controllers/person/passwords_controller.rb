class Person::PasswordsController < Devise::PasswordsController
  def after_sending_reset_password_instructions_path_for(resource_name)
    new_password_path(resource_name) if is_navigational_format?
  end
end
