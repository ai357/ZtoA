class Companies::PostsController < ApplicationController

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(posts_params)
    @post.company_id = current_company.id
    if @post.save
      redirect_to companies_posts_path, notice: "投稿に成功しました。"
    else
      @posts = Post.left_joins(:company).where("companies.id = ?", current_company.id)
      @employee_posts = Post.left_joins(employee: :company).where("companies.id = ?", current_company.id)
      @company = current_company
      render :index
    end
  end
  
  def index
    @post = Post.new
    @posts = Post.left_joins(:company).where("companies.id = ?", current_company.id)
    #ログインしている企業IDと投稿した利用者が属している企業IDが同じ投稿を取ってくる
    @employee_posts = Post.left_joins(employee: :company).where("companies.id = ?", current_company.id)
    # @posts = Post.left_joins(:employee).left_joins(:company).where("employees.name LIKE ? or companies.name LIKE ?", "%#{current_company.name}%","%#{current_company.name}%")
    @company = current_company
    # binding.pry
  end
  
  def show
    @post = Post.find(params[:id])
    @company = current_company
    @comments = @post.comments
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to companies_posts_path
  end

 private

   def posts_params
      params.require(:post).permit(:title, :body, :employee_id, :company_id)
   end

end