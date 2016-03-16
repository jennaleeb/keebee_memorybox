class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # protect_from_forgery with: :null_session

  protected
    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to new_user_registration_path, :notice => 'if you want to add a notice'
      end
    end

end
