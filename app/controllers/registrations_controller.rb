class RegistrationsController < Devise::RegistrationsController

	before_filter :configure_permitted_parameters

	# GET /users/sign_up
  def new
  @user = User.new

  # resource = build_resource({})
  # resource.build_customer
  # resource.build_account
  # resource.build_address
  # respond_with resource

	build_resource({})
		self.resource[:customer => Customer.new, :account => Account.new, :address => Address.new]
	respond_with self.resource
  end

  def create
  @user = User.new
  # Override Devise default behavior and create a customer, account, and address as well
  
  # @user = User.new

  # build_resource({})
  # self.resource[:customer => Customer.new, :account => Account.new, :address => Address.new]
  # respond_with self.resource
  resource = build_resource(params[:sign_up])

  if(resource.save)
    sign_in(resource_name, resource)
    respond_with resource, :location => after_sign_up_path_for(resource)
  else
    render :action => "new"
  end
  end


  private

  # def build_resource(hash=nil)
  #       hash ||= params[resource_name] || {}
  #       self.resource = resource_class.new(hash)
  # end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u|
      u.permit(:username, :email, :password, :password_confirmation,
      		   customer_attributes: [:title, :firstname, :lastname, :phone1, :phone2],
      		   account_attributes: [:acct_type],
      		   address_attributes: [:address1, :address2, :zip_code])
    }
  end
  
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) { |u|
  #     u.permit(customer_attributes: [])
  #   }
  # end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) { |u|
  #     u.permit(address_attributes: [])
  #   }
  # end


  #   devise_parameter_sanitizer.for(:customer) { |u|
  #     u.permit(:title, :firstname, :lastname, :phone1, :phone2)

  # }
  # devise_parameter_sanitizer.for(:account) { |u|
  #     u.permit(:acct_type)

  # }
  # devise_parameter_sanitizer.for(:customer) { |u|
  #     u.permit(:address1, :address2, :zip_code)

  # }
end
