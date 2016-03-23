class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def loggedin?
    if cookies[:adminkey] != Login.find(2).adminkey
      return false
    else
      return true
    end
  end
end
