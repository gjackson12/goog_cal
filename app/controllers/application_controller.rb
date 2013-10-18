class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def google_token
    if Rails.env.test?
      ENV['GOOGLE_TOKEN']
    else
      session[:token]
    end
  end
end
