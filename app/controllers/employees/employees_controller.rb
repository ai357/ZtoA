class Employees::EmployeesController < ApplicationController
  #ログインしているユーザー(current-employee)かつparamsIDを持っているレコード（@Employee)が一致していないと見れないページ
  before_action :set_employee, only: %i[ show edit update ]
  #before_action :correct_employee, only: %i[ show edit update ]

  def show
  end

  def update
    if @employee.update(employee_params)
      sign_in(:employee, @employee)
      redirect_to employees_employee_url, notice: "編集しました"

    else
      flash.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  private

  def set_employee
    @employee = current_employee
  end

  def correct_employee
    #URLに不正なIDを打たれた場合、rootに遷移する
    redirect_to root_url if @employee != current_employee
  end

  def employee_params
    params.require(:employee).permit(:name, :email)
  end
end


