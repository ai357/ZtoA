class Employees::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.employee_id = current_employee.id
    if @post.save
      redirect_to employes_posts_path, notice: "投稿に成功しました。"
    else
      @posts = Post.all
      @company = current_employee
      render :index
    end
  end

  def index
    @post = Post.new
    @posts = Post.all
    @company = current_employee
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









  def edit
  end


  def update
    if @employee.update(employee_params)
       redirect_to companies_employee_url(@employee), notice: "編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end
  

  def destroy
    @employes.update(is_daleted: true)
    redirect_to companies_employees_url, notice: "削除しました"
  end
  

  private
  
    def set_employee
      @employee = Employee.find(params[:id])
    end
    
    def employee_params
      params.require(:employee).permit(:name, :email, :password)
    end
    
end

