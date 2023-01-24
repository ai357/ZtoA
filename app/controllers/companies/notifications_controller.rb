class Companies::NotificationsController < ApplicationController

def index
  @notifications = Notification.where(company_id: current_company.id)
end
  
end
