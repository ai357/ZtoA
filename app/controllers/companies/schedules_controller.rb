class Companies::SchedulesController < ApplicationController

def index
   @schedules = Schedule.all
    # @schedules = current_company.employees.schedules
   @employee = current_company.employees
end


end
