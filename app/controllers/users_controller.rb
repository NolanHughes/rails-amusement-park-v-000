class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def show
    if session[:user_id].nil?
      redirect_to root_url
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end

end
