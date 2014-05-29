class ApplicationController < ActionController::Base
<<<<<<< HEAD
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
=======
  protect_from_forgery

  def permission_denied
    render file: "public/401.html", layout: false, status: :unauthorized
  end
>>>>>>> c0b2bf0e55e8bd9e6dab63089e88a0350b6e15b4
end
