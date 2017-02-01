class SessionsController < ApplicationController
  def create
    signed_in = params[:username] == ENV['USERNAME'] && params[:password] == ENV['PASSWORD']

    if signed_in
      cookies.permanent.signed[:signed_in_secret] = ENV['SIGNED_IN_SECRET']
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    cookies.permanent.signed[:signed_in_secret] = nil
    redirect_to new_session_path
  end
end
