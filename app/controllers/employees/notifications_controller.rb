class Employees::NotificationsController < ApplicationController

  def index
    @notifications = Notification.all
  end

end
