class Companies::NotificationsController < ApplicationController

  def index
    # @notifications = Notification.where(company_id: current_company.id)
     @notifications = Notification.left_joins(:company).where("companies.id = ?", current_company.id)
     @notifications = Notification.left_joins(employee: :company).where("companies.id = ?", current_company.id)
  end
  
end
