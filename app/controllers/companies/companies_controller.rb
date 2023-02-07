class Companies::CompaniesController < ApplicationController
  before_action :authenticate_company!, except: %i[ unsubscribe withdraw ]
  
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
    @company = current_company
  end

  def withdraw
    @company = current_company
    @company.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end  

  private

  def company_params
    params.require(:company).permit(:name, :email)
  end

end
