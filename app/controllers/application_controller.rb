class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fast_name, :second_name, :kana_fast_name, :kana_second_name, :postal_code, :address, :telephone_number, ])
  end

  def after_sign_in_path_for(resource)
   if resource.class.name == "Customer"
      root_path
   elsif resource.class.name == "Admin"
      admin_root_path
   end
  end


end


