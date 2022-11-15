# frozen_string_literal: true

class AccountsController < ApplicationController
  layout "default_page"
  include Secured
  before_action :set_account, only: %i[show edit update destroy]

  # GET /accounts or /accounts.json
  def index
    
    @accounts = Account.all
    @current_user = @accounts.find_by uuid: session[:useruuid]

    unless @current_user.status_id == 2 or @current_user.status_id == 1
      render 'invalid'
    end
  end

  # GET /accounts/1 or /accounts/1.json
  def show
    @accounts = Account.all
    @registered_events = Signup.where(account_id: @account.id)
    @registered_events_count = @registered_events.size
    @current_user = @accounts.find_by uuid: session[:useruuid]
    if @current_user.status_id == 1 or @current_user.status_id == 2 or @current_user.id == @account.id
      @points = Point.all
      @mypoints=@points.where(account_id: @account.id)
      @total_points = @mypoints.all.sum (:Points)
    else
      render 'invalid'
    end

  end

  # GET /accounts/new
  def new
    @current_user = Account.find_by uuid: session[:useruuid]
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
    @current_user = Account.find_by uuid: session[:useruuid]
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)
    @current_user = Account.find_by uuid: session[:useruuid]
    respond_to do |format|
      if @account.save
        format.html { redirect_to(account_url(@account), success: 'Account was successfully created.') }
        format.json { render(:show, status: :created, location: @account) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @account.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    @current_user = Account.find_by uuid: session[:useruuid]
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to(account_url(@account), success: 'Account was successfully updated.') }
        format.json { render(:show, status: :ok, location: @account) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @account.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    # @account.destroy!
    @current_user = Account.find_by uuid: session[:useruuid]
    if(@current_user.status_id == 1 or @current_user.status_id == 2)
      @account.update(:status_id => 4)
      respond_to do |format|
        format.html { redirect_to(accounts_url, success: 'Account was successfully archived.') }
        format.json { head(:no_content) }
      end
    else
      render 'invalid'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(:UIN, :FirstName, :LastName, :PhoneNumber, :Email, :status_id, :uuid)
  end
end
