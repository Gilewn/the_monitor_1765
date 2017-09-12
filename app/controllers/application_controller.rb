class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :html, :json

  def require_moderator
    redirect_to '/' unless current_user.role.name == 'moderator'
  end

  def require_admin
    redirect_to '/' unless current_user.role.name == 'admin'
  end

  def require_banned
    if current_user && current_user.email == 'banned@bannedmail.ban'
      current_user.role_id = 4
      sign_out if current_user.role.name == 'banned'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[role_id])
  end
end
