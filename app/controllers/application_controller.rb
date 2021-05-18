# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :congigure_permitted_parameters, if: :devise_controller?

  protected

  def congigure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name zip address introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name zip address introduction])
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_up_path_for(resource)
    user_path(resource)
  end

end
