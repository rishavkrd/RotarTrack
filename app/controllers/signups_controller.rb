# frozen_string_literal: true

class SignupsController < ApplicationController
  include Secured
  before_action :set_signup, only: %i[show edit update destroy]
  layout "default_page"

  # GET /signups or /signups.json
  def index
    @current_user = Account.find_by uuid: session[:useruuid]
    unless @current_user.status_id == 1
      redirect_to "/dashboard"
    end
    @signups = Signup.all
  end

  # GET /signups/1 or /signups/1.json
  def show; end

  # GET /signups/new
  def new
    @signup = Signup.new
  end

  # GET /signups/1/edit
  def edit; end

  # POST /signups or /signups.json
  def create
    @signup = Signup.new(signup_params)
    eventDateTime = DateTime.new(@signup.event.Date.year, @signup.event.Date.month, @signup.event.Date.day, @signup.event.Time.hour, @signup.event.Time.min, @signup.event.Time.sec)
    cutoffDateTime = eventDateTime - (6/24.0)
    signupTime = DateTime.now.in_time_zone("Central Time (US & Canada)")
    convertedTime = DateTime.new(signupTime.year, signupTime.month, signupTime.day, signupTime.hour, signupTime.min, signupTime.sec)
    if (convertedTime > cutoffDateTime)
      respond_to do |format|
        format.html { redirect_to({ :action => "new"}, notice: "Cannot sign up for event within 6 hours of start time") }
        format.json { render :new, status: :unprocessable_entity, location: @signup }
      end
    else
      respond_to do |format|
        if (@signup.save)
          format.html { redirect_to signup_url(@signup), notice: "Signup was successfully created." }
          format.json { render :show, status: :created, location: @signup }
        else
          format.html { render(:new, status: :unprocessable_entity) }
          format.json { render(json: @signup.errors, status: :unprocessable_entity) }
        end
      end
    end
  end

  # PATCH/PUT /signups/1 or /signups/1.json
  def update
    eventDateTime = DateTime.new(@signup.event.Date.year, @signup.event.Date.month, @signup.event.Date.day, @signup.event.Time.hour, @signup.event.Time.min, @signup.event.Time.sec)
    cutoffDateTime = eventDateTime - (6/24.0)
    signupTime = DateTime.now.in_time_zone("Central Time (US & Canada)")
    convertedTime = DateTime.new(signupTime.year, signupTime.month, signupTime.day, signupTime.hour, signupTime.min, signupTime.sec)
    if (convertedTime > cutoffDateTime)
      respond_to do |format|
        format.html { redirect_to({ :action => "edit"}, notice: "Cannot sign up for event within 6 hours of start time") }
        format.json { render :edit, status: :unprocessable_entity, location: @signup }
      end
    else
      respond_to do |format|
        if (@signup.save)
          format.html { redirect_to signup_url(@signup), notice: "Signup was successfully created." }
          format.json { render :show, status: :created, location: @signup }
        else
          format.html { render(:edit, status: :unprocessable_entity) }
          format.json { render(json: @signup.errors, status: :unprocessable_entity) }
        end
      end
    end
  end

  # DELETE /signups/1 or /signups/1.json
  def destroy
    @signup.destroy!

    respond_to do |format|
      format.html { redirect_to(signups_url, notice: 'Signup was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_signup
    @signup = Signup.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def signup_params
    params.require(:signup).permit(:event_id, :account_id, :Pickup)
  end
end
