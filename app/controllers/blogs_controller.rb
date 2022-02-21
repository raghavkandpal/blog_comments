class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :delete, :new]

  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  def show
    @comment = Comment.new

    @comments = @blog.comments.order(created_at: :desc)
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def myposts
    @blog=Blog.where(author: current_user.email)
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.author = current_user.email
    if @blog.save
      redirect_to @blog
    else
      redirect_to 'new'    
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to root_path
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
