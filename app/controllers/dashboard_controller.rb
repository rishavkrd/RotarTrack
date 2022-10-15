class DashboardController < ApplicationController
    include Secured
    def show
      @user = session[:userinfo]
      @events = Event.all
      usr_email = @user["email"]
      @account = Account.find_by_Email (usr_email)
      # respond_to do |format|
      # if @account==nil
      #   redirect_to new_account_path, notice: "New Account was successfully added." 
    end
    def help
    end
end
