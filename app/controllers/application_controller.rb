class ApplicationController < ActionController::Base
  helper_method :current_order
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token, only: :github

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.superadmin?
      flash[:alert] = 'Unauthorized Access!'
      redirect_to root_path
    end
  end

  def current_order
    Order.find_or_create_by(user: current_user, status: 'pending')
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
