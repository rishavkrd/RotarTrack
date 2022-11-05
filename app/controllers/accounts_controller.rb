# frozen_string_literal: true

class AccountsController < ApplicationController
  include Secured
  before_action :set_account, only: %i[show edit update destroy]

  # GET /accounts or /accounts.json
  def index
    @accounts = Account.all
    @current_user = @accounts.find_by(Email: get_user_email)

    render('invalid') unless @current_user.status_id == 1
  end

  # GET /accounts/1 or /accounts/1.json
  def show
    @points = Point.all
    @mypoints = @points.where(account_id: @account.id)
    @total_points = @mypoints.all.sum(:Points)
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit; end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to(account_url(@account), notice: 'Account was successfully created.') }
        format.json { render(:show, status: :created, location: @account) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @account.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to(account_url(@account), notice: 'Account was successfully updated.') }
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
    @account.update!(status_id: 3)
    respond_to do |format|
      format.html { redirect_to(accounts_url, notice: 'Account was successfully archived.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(:UIN, :FirstName, :LastName, :PhoneNumber, :Email, :status_id)
  end
end
