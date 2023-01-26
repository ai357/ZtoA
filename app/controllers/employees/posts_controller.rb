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
    if params[:name]
      @posts = Post.left_joins(:employee).left_joins(:company).where("employees.name LIKE ? or companies.name LIKE ?", "%#{params[:name]}%","%#{params[:name]}%")
    end
    # binding.pry
  end

  def show
    @post = Post.find(params[:id])
    @employees = Employee.find_by(id: @post.employee_id)
    @company = Company.find_by(id: @post.company_id)
    @comments = @post.comments
    @employee = current_employee
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to employees_posts_path
  end

 private

 def posts_params
    params.require(:post).permit(:title, :body, :employee_id, :company_id)
 end


end









