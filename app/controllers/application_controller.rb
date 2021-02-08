class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :store_action

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

  def store_action
    return unless request.get?
    if (request.path != "/user/sign_in" &&
      request.path != "/user/sign_up" &&
      request.path != "/user/password/new" &&
      request.path != "/user/password/edit" &&
      request.path != "/user/confirmation" &&
      request.path != "/user/sign_out" &&
      !request.xhr?) # don't store ajax calls
      store_location_for(:user, user_path)
    end
  end
end


