class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:index, :show]
  before_action :basic_furima

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :family_name, :first_name_kana, :family_name_kana, :birthday])
  end
  def basic_furima
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_FURIMA_USER"] && password == ENV["BASIC_FURIMA_PASSWORD"]
    end
  end
  
end
