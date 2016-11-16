class Accounts::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  def new
    @account = Account.new
  end

  def create
    account = Account.find_by_email(params[:account][:email])
    if !account
      @account = Account.build(account_params)
      if @account
        redirect_to "/"
      else
        render :json => "Your account can not be created for now!"
      end
    else
      render :json => "This email has been used!"
    end
  end

  private
    def account_params
      params.require(:account).permit(:email, :password, :password_confirmation)
    end
end
