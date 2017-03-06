class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_raven_context
  before_action :set_navbar_categories
  # before_action :authenticate_user!
  protect_from_forgery with: :exception
  # v.3.5 syntax. will be deprecated in 4.0



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :password, :remember_me)
    end

    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation)
    end
  end

  private

  def set_raven_context
    Raven.user_context(id: session[:current_user_id]) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

  private

  def set_navbar_categories
    @categories = Category.all
  end

  protected :configure_permitted_parameters
end
