class HomeController < ApplicationController
  layout 'home'
  def index
    if !current_account
      redirect_to '/accounts/sign_in'
    else
      @blogs = Blog.all.order("created_at").limit(10)
      @most_commented_blogs = Blog.joins(:comments).group("blogs.id").select("blogs.*, COUNT(comments.id) comment_count").order("comment_count DESC").limit(10)
    end
  end
end
