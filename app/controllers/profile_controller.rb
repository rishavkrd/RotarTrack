class ProfileController < ApplicationController
    include Secured

    def create
        @user = session[:userinfo]
        @account = Account.new
    end

    def new
        @user = session[:userinfo]
        email = @user["email"]
        @account = Account.new(:UIN => params[:account][:UIN], :FirstName => params[:account][:FirstName], :LastName => params[:account][:LastName], :PhoneNumber => params[:account][:PhoneNumber], :Email => email, :status_id => 2)
        if @account.save!
            flash[:notice] = "You've completed your account."
            redirect_to "/dashboard"
        else
            flash.now[:notice] = "Failed to create account"
            render :create
        end
    end
end