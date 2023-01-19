class Companies::DocumentsController < ApplicationController
  
  def index
    # 条件を絞って検索したいテーブル名.where(カラム名: 検索したい値)
    @documents = Document.where(employee_id: params[:employee_id])
  end
  
  def updated
    @documents = Document.all
    @submit = Document.submission_status
  end
  
end
