class User::UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.new
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end


private

  def user_params
    params.require(:user).permit(:name, :number, :expected, :birth, :email)
  end

end
