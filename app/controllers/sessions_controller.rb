class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by(name: params[:name])
      if user and user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to wines_url, alert: "Logged in successfully; welcome back!"
      else
          redirect_to login_url, alert: "Username or password is incorrect."
      end
  end

  def destroy
      session[:user_id] = nil # boom
      redirect_to wine_url, notice: "Signed out. Thank you for visiting."
  end
end
