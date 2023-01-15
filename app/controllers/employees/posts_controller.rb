class Employees::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.employee_id = current_employee.id
    if @post.save
      redirect_to employees_posts_path, notice: "投稿に成功しました。"
    else
      @posts = Post.all
      @employee = current_employee
      render :index
    end
  end

  def index
    @post = Post.new
    @posts = Post.all
    @employee = current_employee
    # binding.pry
  end

  def show
    @post = Post.find(params[:id])
    @company = Employee.find(@post.employee_id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

 private

 def posts_params
    params.require(:post).permit(:title, :body)
 end


end









 