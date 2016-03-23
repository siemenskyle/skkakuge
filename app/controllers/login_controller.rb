class LoginController < ApplicationController

  def login
    redirect_to "/admin" and return if loggedin? == true
  end

  def trylogin
    pw = params[:pw]
    if pw == Login.find(1).pw
      key = SecureRandom.hex
      cookies[:adminkey] = {:value => key, :expires => Time.now + 3600}
      l = Login.find(2)
      l.adminkey = key
      l.save
      redirect_to "/admin" and return
    else
      redirect_to "/admin/login" and return
    end
  end

  def logout
    cookies.delete :adminkey
  end


end
