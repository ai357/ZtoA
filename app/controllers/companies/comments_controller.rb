class Companies::CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.comment_status = 0
    @comment.company_id = current_company.id
    @comment.employee_id = @post.employee_id
    if @comment.save
      notification = Notification.new(employee_id: @comment.post.employee_id, post_id: @comment.post_id, company_id: @comment.company_id, notification_status:0)
      notification.save!
      redirect_to companies_post_path(@comment.post_id)
    else
      render :show
    end
  end

  private

  def comment_params
      params.permit(:contents, :post_id)
  end

end
