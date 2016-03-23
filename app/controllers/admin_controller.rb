class AdminController < ApplicationController
  def menu
    redirect_to "/admin/login" and return if loggedin? == false
  end
end
