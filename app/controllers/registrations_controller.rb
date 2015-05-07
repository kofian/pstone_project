# Barnabas Bulpett
# WEB-289-YD1
# Spring 2015
# registrations_controller.rb

# This controller defines a class which inherits from Devise's Registrations Controller
class RegistrationsController < Devise::RegistrationsController
  # Inhreit content of create method from parent
  def create
    if !verify_recaptcha
      flash.delete :recaptcha_error
      build_resource(sign_up_params)
      resource.valid?
      resource.errors.add(:base, "There was an error with the recaptcha code below. Please re-enter the code.")
      respond_with_navigational(resource) { render :new }
    else
      flash.delete :recaptcha_error
      super
    end
  end
  # Route new users to their "customer" page after registration
  def after_sign_up_path_for(resource)
    new_user_customers_path(current_user)
  end
end
