# frozen_string_literal: true

class ProfileController < ApplicationController
  def create
    redirect_to('/') if session[:userinfo].blank?
    @user = session[:userinfo]
    @account = Account.new
  end

  def new
    @account = Account.new(:UIN => params[:account][:UIN], :FirstName => params[:account][:FirstName], :LastName => params[:account][:LastName], :PhoneNumber => params[:account][:PhoneNumber], :Email => get_user_email, :status_id => 2)
    if @account.save!
        flash[:notice] = "You've completed your account."
        redirect_to "/dashboard"
    else
        flash.now[:notice] = "Failed to create account"
        render :create
    end
  end
end
