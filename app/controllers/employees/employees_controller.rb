class Employees::EmployeesController < ApplicationController
  before_action :authenticate_employee!
  #ログインしているユーザー(current-employee)かつparamsIDを持っているレコード（@Employee)が一致していないと見れないページ
  before_action :set_employee, only: %i[ show edit update ]
  #before_action :correct_employee, only: %i[ show edit update ]

  def show
  end

  def update
    @employee.update(employee_params)
    stage_days = [56, 57, 112, 167, 222, 277, 332, 387]
      #sign_in(:employee, @employee)
    if @employee.save
      if employee_params[:expected].present?
        if Schedule.find_by(employee_name: current_employee.name, leave_stage: 0).present?
          # expectedの入力が2回目以降の場合、updateで名前を表示させる日付を更新する
          Schedule.find_by(employee_name: current_employee.name, leave_stage: 0).update(start_time: @employee.expected - 41)
        else
          #expecteを初めて入力した場合に実行する
          Schedule.create(employee_name: current_employee.name, leave_stage: 0, start_time: @employee.expected - 41)
        end
      end

      if employee_params[:birth].present?
        #dayにstage_daysの数字、iに0始まりの順番が入っている（例：day=56 i=0)
        stage_days.each_with_index do |day, i|
          if Schedule.find_by(employee_name: current_employee.name, leave_stage: i+1).present?
            Schedule.find_by(employee_name: current_employee.name, leave_stage: i+1).update(start_time: @employee.birth + day)
          else
            Schedule.create(employee_name: current_employee.name, leave_stage: i+1, start_time: @employee.birth + day)
          end
        end
      end

      notification = Notification.new(employee_id: current_employee.id, company_id: current_employee.company_id, notification_status:1)
      notification.save!

      redirect_to employees_employee_url, notice: "編集しました"

    else
      flash.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  def unsubscribe
     @user = Employee.find_by(email: params[:email])
  end

  def withdraw
    @employee = Employee.find_by(params[:id])
    @employee.update(is_deleted: true)
    reset_session
    redirect_to companies_employees_path
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
    params.require(:employee).permit(:name, :email, :password, :status, :expected, :birth, :baby_name)
  end
end


