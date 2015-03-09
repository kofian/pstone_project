class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
  	if current_user.role == 'admin'
  		adminview_administrator_path(current_user, format: :html)
  	else
  		accounts_path(current_user, format: :html)
  	end
  end

  protected
  	def configure_permitted_parameters
	    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation,
                                            customer_attributes: [:title, :firstname, :lastname, :phone1, :phone2],
                                            account_attributes: [:acct_type],
                                            address_attributes: [:address1, :address2, :zip_code]) }
	    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password) }
	    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  	end

	 #  def configure_permitted_parameters
	 #  	devise_parameter_sanitizer.for(:sign_in) {|u| u.permit(:signin)}
		# devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :username, :password, :password_confirmation)}
	 #  end
end
