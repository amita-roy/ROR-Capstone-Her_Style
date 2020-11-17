class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.name == params[:name]
      session[:user_id] = user.id
      redirect_to user, flash: { notice: "Welcome back, #{user.name}!" }
    else
      flash.now[:alert] = 'No user found, Please enter valid name'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to events_url, notice: 'You are successfully signed out!'
  end
end
