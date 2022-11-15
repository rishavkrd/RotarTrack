# frozen_string_literal: true

class ProfileController < ApplicationController
  layout 'default_page'
  def create
    redirect_to('/') if session[:userinfo].blank?
    @user = session[:userinfo]
    email = @user['email']
    render('/profile/error') unless email.end_with?('@tamu.edu')
    user_uid = session[:useruuid]
    curruser = Account.find_by(uuid: user_uid)
    redirect_to('/dashboard') if curruser
    @account = Account.new
    @user_uid = session[:useruuid]
  end

  def new
    member_id = Status.where(Value: 'Member').pick(:id)
    @account = Account.new(UIN: params[:account][:UIN], FirstName: params[:account][:FirstName], LastName: params[:account][:LastName],
                           # rubocop:todo Layout/LineLength
                           PhoneNumber: params[:account][:PhoneNumber], Email: get_user_email, status_id: member_id, uuid: session[:useruuid]
      # rubocop:enable Layout/LineLength
    )
    respond_to do |format|
      if @account.save
        format.html { redirect_to('/dashboard', success: 'Account was successfully created.') }
        format.json { render(:show, status: :created, location: @account) }
      else
        format.html { render(:create, status: :unprocessable_entity) }
        format.json { render(json: @account.errors, status: :unprocessable_entity) }
      end
    end
  end
end
