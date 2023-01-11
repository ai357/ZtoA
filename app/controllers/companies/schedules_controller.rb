class Companies::SchedulesController < ApplicationController

def index
    @schedules = Schedule.all
end

def create
    #Employee.expected-42
    @plan = Employee.expected - 42
end



end
