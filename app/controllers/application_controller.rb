class ApplicationController < ActionController::Base
  layout :layout_by_resource
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
    home_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username])
  end

  def layout_by_resource
    if devise_controller? && action_name == "new"
      "signin"
    else
      "application"
    end
  end

end
