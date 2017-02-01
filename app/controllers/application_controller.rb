class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :verify_signed_in

  helper_method :user_signed_in?

  protected

  def user_signed_in?
    cookies.permanent.signed[:signed_in_secret] == ENV['SIGNED_IN_SECRET']
  end

  def verify_signed_in
    return if user_signed_in? || params[:controller] == 'sessions'

    redirect_to new_session_path
  end
end
