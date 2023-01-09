class Companies::EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]

  def index
    @employees = current_company.employees
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = current_company.employees.build(employee_params)

    if @employee.save
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

  def destroy
    @employee.update(is_deleted: true)
    redirect_to companies_employees_url, notice: "削除しました"
  end

  private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :email, :password, :status)
    end
end
