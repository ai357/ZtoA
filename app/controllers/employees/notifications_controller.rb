class Employees::NotificationsController < ApplicationController

  #お知らせページ
  def index
    @notifications = Notification.all
  end

end
