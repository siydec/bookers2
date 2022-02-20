class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]

  before_action :congigure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    flash[:notice] = "Welcome! You have signed up successfully."
     user_path(current_user[:id])
  end

  def after_sign_out_path_for(resource)
    flash[:notice]
    root_path
  end

  protected

  def congigure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])

  end

end
