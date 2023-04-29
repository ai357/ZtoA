class Companies::CompaniesController < ApplicationController
  before_action :authenticate_company!, except: %i[ unsubscribe withdraw ]
  
  def show
    # 企業詳細（企業用）
    @company = current_company
  end
  
  def edit
    # 企業編集（企業用）
    @company = current_company
  end
  
  def update
    # 企業情報更新（企業用）
    @company = current_company
    @company.update(company_params)
    redirect_to companies_company_path
  end

  def unsubscribe
    # 企業退会確認（企業用）
    @company = current_company
  end

  def withdraw
    # 企業退会（企業用）
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
