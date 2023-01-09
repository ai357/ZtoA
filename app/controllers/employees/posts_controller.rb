class Employees::PostsController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]
  
  def

  def edit
  end


  def update
    if @employee.update(employee_params)
       redirect_to companies_employee_url(@employee), notice: "編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end
  

  def destroy
    @employes.update(is_daleted: true)
    redirect_to companies_employees_url, notice: "削除しました"
  end
  

  private
  
    def set_employee
      @employee = Employee.find(params[:id])
    end
    
    def employee_params
      params.require(:employee).permit(:name, :email, :password)
    end
    
end

