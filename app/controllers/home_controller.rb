class HomeController < ApplicationController
  layout 'home'
  def index
    if !current_account
      redirect_to '/auth/login'
    end
  end
end
