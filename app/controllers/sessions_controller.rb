class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by_username(params[:username])
    flash.now[:alert] = 'Username invalid' if @user.nil?
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Logged in!'
    else
      flash.now[:alert] ||= 'Password invalid'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end
end
