class SessionsController < ApplicationController

  def create
    if @user = User.find_by(name: params[:user][:name])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to signin_path
      end
    else
      redirect_to signin_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end
