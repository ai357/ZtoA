class Company::UserController < ApplicationController
  
  def index
    @user = User.all
  end
  
  def show
    byebug
    @user = User.find(params[:id])
  end
  
  
  private
  
  def user_params
  params.require(:user).permit(:name, :number, :expected, :birth, :email )
  end
  
end
