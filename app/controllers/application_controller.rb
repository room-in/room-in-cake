class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fast_name, :second_name, :kana_fast_name, :kana_second_name, :postal_code, :address, :telephone_number, ])
  end
  
  def after_sign_path_for(resource)
    case resource
    when Customer
      homes_path
    when Admin
      admin_homes_path
    end
  end
    
end


