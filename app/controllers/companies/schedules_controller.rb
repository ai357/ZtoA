class Companies::SchedulesController < ApplicationController

def index
    @schedules = Schedule.all
end

def create
    #Employee.expected-42
    @plan = Employee.expected - 41
    @plan1 = Employee.birth + 56
    @plan2 = Employee.birth + 56 + 1
    @plan3 = Employee.birth + 56 + 1 + 55
    @plan4 = Employee.birth + 56 + 1 + 55 + 55
    @plan5 = Employee.birth + 56 + 1 + 55 + 55 + 55
    @plan6 = Employee.birth + 56 + 1 + 55 + 55 + 55 + 55
    @plan7 = Employee.birth + 56 + 1 + 55 + 55 + 55 + 55 + 55
    @plan8 = Employee.birth + 56 + 1 + 55 + 55 + 55 + 55 + 55 + 55
end



end
