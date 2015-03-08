class RegistrationsController < Devise::RegistrationsController

	before_filter :configure_permitted_parameters

	# GET /users/sign_up
  def new
  	@user = current_user
  	@customer = nil #@user.customer
  	@account = nil #@customer.account
  	@address = nil #@customer.address

    # Override Devise default behavior and create a customer, account, and address as well
    build_resource({})
    	resource.build_customer
	respond_with self.resource

	build_resource({})
    	resource.build_account
    respond_with self.resource

    build_resource({})
    	resource.build_address
    respond_with self.resource
    
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u|
      u.permit(:username, :email, :password, :password_confirmation,
      		   :customer_attributes => [:phone1, :phone2, :title, :firstname, :lastname],
      		   :account_attributes => :acct_type,
      		   :address_attributes => [:address1, :address2, :zip_code])
    }
  end
end
