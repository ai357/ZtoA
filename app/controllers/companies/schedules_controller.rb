class Companies::SchedulesController < ApplicationController

def index
    # @schedules = current_company.employees.schedules
   @employee = current_company.employees
   @schedules = Schedule.left_joins(employee: :company).where("companies.id = ?", current_company.id)

end


end
