class BlogsController < ApplicationController
  layout "home"
  def new
    if current_account
      @blog = current_account.blogs.new
    else
      redirect_to "/"
    end
  end
  def create
    if current_account
      @blog = current_account.blogs.create(blog_params)
      if @blog
        redirect_to "/blogs"
      else
        render :new
      end
    else
      redirect_to "/"
    end
  end

  def show
    if current_account
      @blogs = current_account.blogs.order("created_at DESC")
    else
      @blogs = Blog.all.order("created_at DESC")
    end
    if params[:page]
      @blogs = @blogs.page(params[:page]).per(10)
    else
      @blogs = @blogs.page(1).per(10)
    end
  end

  def destroy
    blog = Blog.find_by_id(params[:id])
    if blog.destroy
      render :json => { status: "Success" }
    else
      render :json => { status: "Failed" }
    end

  end

  private
    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
