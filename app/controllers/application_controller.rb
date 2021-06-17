class ApplicationController < ActionController::Base

  protected
  def after_sign_path_for(resource)
    case resource
    when Customer
      homes_path
    when Admin
      admin_homes_path
    end
  end

end
