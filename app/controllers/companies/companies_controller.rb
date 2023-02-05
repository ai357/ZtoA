class Companies::CompaniesController < ApplicationController
  before_action :authenticate_company!
  
  def show
    @company = current_company
  end
  
  def edit
    @company = current_company
  end
  
  def update
    @company = current_company
    @company.update(company_params)
    redirect_to companies_company_path
  end

  def unsubscribe
     @company = Company.find_by(params[:id])
  end

  def withdraw
    @company = Company.find_by(params[:id])
    @company.update(is_deleted: true)
    reset_session
    redirect_to new_company_session
  end

  private

  def company_params
    params.require(:company).permit(:name, :email)
  end

end
