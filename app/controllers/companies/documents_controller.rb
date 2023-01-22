class Companies::DocumentsController < ApplicationController

  def index
    # 条件を絞って検索したいテーブル名.where(カラム名: 検索したい値)
    @documents = Document.where(employee_id: params[:employee_id])
    @employee = Employee.find(params[:employee_id])
  end

  def updated
    @documents = Document.all
    @submit = Document.submission_status
  end

  def submission_status_update
    @document = Document.find(params[:id])
    if @document.submission_status == "yet"
      @document.update(submission_status: 1)
      redirect_to companies_employee_documents_path(params[:employee_id])
    elsif @document.submission_status == "done"
      @document.update(submission_status: 0)
      redirect_to companies_employee_documents_path(params[:employee_id])
    end
  end

end
