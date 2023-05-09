class Employees::CommentsController < ApplicationController

 def create
    @comment = Comment.new(comment_params)
    # modelにてenumでstatus設定
    @comment.comment_status = 1
    @comment.employee_id = current_employee.id
    if @comment.save!
      notification = Notification.new(employee_id: current_employee.id, post_id: @comment.post_id, company_id: current_employee.company.id, notification_status:0)
      notification.save!
      redirect_to employees_post_path(@comment.post_id)
    else
      render :show
    end
 end

  private

  def comment_params
      params.permit(:contents, :post_id)
  end


end
