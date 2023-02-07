class Companies::EmployeesController < ApplicationController
  before_action :authenticate_company!
  before_action :set_employee, only: %i[ show edit update destroy ]

  def index
    # ログインしている企業に属している人（退会した人を除く）
    @employees = current_company.employees.where(is_deleted: false).page(params[:page]).per(10)
    if params[:name]
        @employees = Employee.where("name LIKE ?", "%#{params[:name]}%").where(is_deleted: false)
    end
  end

  def show
    @employee_name = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = current_company.employees.build(employee_params)

    if @employee.save
      DocumentMaster.all.each do |d|
        # employeeのデータ作成の際にそのemployeeの書類を初期状態（未提出ステータス）で作成する
       Document.create(document_master_id: d.id, employee_id: @employee.id, submission_status: 0)
      end
      redirect_to companies_employees_url, notice: "登録しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def update
    @employee.update_without_current_password(employee_params)
    if @employee.save
      redirect_to companies_employee_url(@employee), notice: "編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end
  
  private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :email, :password, :status)
    end
    
end
