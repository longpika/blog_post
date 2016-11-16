class HomeController < ApplicationController
  layout 'home'
  def index
    if !current_account
      redirect_to '/auth/login'
    else
      @blogs = Blog.all.order("created_at").limit(10)
    end
  end
end
