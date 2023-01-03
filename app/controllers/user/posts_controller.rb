class User::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id), notice: "You have created book successfully."
    else
      @posts = Post.all
      @user = current_user
      render :index
    end
  end

  def index
    @post = Post.new
    @posts = Post.all
    @user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
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



