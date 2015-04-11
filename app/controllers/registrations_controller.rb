class RegistrationsController < Devise::RegistrationsController
  
  def create
  	super
  end

  def after_sign_up_path_for(resource)
    new_user_customers_path(current_user)
  end

  # protected

  # def sign_up(resource_name, resource)
  # 	true
  # end

end
