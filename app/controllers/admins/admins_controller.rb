class Admins::AdminsController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_id)
  end

  def message
    @message = Message.new
    @message.create
  end

end
