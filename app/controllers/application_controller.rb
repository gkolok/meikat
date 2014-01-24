class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
         if (username == ADMIN_ID && password == ADMIN_PASSWORD)
            session[:role] = :admin
         else
         end
      end
    end
end
