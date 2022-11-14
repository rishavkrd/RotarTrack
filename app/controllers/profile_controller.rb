# frozen_string_literal: true

class ProfileController < ApplicationController
  def create
    redirect_to('/') if session[:userinfo].blank?
    @user = session[:userinfo]
    email = @user["email"]
    render('/profile/error') if email.blank?
    render('/profile/error') unless email.end_with?("@tamu.edu")

    #if email.blank?
    #  render('/profile/error')
    #  reset_session
    #end

    #unless email.end_with?("@tamu.edu")
    #  render('/profile/error')
    #  reset_session
    #end

    @account = Account.new
    @user_uid = session[:useruuid]
  end

  def new
    member_id = Status.where(Value: 'Member').pick(:id)
    @account = Account.new(:UIN => params[:account][:UIN], :FirstName => params[:account][:FirstName], :LastName => params[:account][:LastName], :PhoneNumber => params[:account][:PhoneNumber], :Email => get_user_email, :status_id => member_id, :uuid => session[:useruuid])
    respond_to do |format|
      if @account.save
        format.html { redirect_to("/dashboard", notice: 'Account was successfully created.') }
        format.json { render(:show, status: :created, location: @account) }
      else
        format.html { render(:create, status: :unprocessable_entity) }
        format.json { render(json: @account.errors, status: :unprocessable_entity) }
      end
    end
  end

end
