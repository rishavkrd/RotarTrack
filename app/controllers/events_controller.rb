# frozen_string_literal: true

class EventsController < ApplicationController
  include Secured
  layout "default_page"
  before_action :set_event, only: %i[show edit update destroy]

  # GET /events or /events.json
  def index
    @current_user = Account.find_by uuid: session[:useruuid]
    if @current_user.status_id == 1
      @events = Event.all.order(:Date)
    else
      @events = Event.where.not(type_id: 5).order(:Date)
    end
  end

  # GET /events/1 or /events/1.json
  def show
    @current_user = Account.find_by uuid: session[:useruuid]
    @signups = Signup.where(event_id: @event.id)
    @user = session[:userinfo]
    usr_email = @user['email']
    @account = Account.find_by(Email: usr_email)
    @hasSignedUp = false
    @signup = Signup.find_by(event_id: params[:id], account_id: @current_user.id)
    
    if @signup
      @hasSignedUp = true
    end

  end

  # GET /events/new
  def new
    @current_user = Account.find_by uuid: session[:useruuid]
    unless @current_user.status_id == 2 or @current_user.status_id == 1
      redirect_to "/dashboard"
    end

    @event = Event.new
  end

  # GET /events/1/edit
  def edit;
    @current_user = Account.find_by uuid: session[:useruuid]
    unless @current_user.status_id == 2 or @current_user.status_id == 1
      redirect_to "/dashboard"
    end
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_back fallback_location: '/dashboard', success: 'Event was successfully created.' }
        format.json { render(:show, status: :created, location: @event) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @event.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_back fallback_location: '/dashboard', success: 'Event was successfully updated.' }
        format.json { render(:show, status: :ok, location: @event) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @event.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    current_user = Account.find_by uuid: session[:useruuid]
    if current_user.status_id == 1 or current_user.status_id == 2
      # @event.destroy!
      @event.update(:type_id => 5)
      respond_to do |format|
        format.html { redirect_back fallback_location: '/dashboard', success: 'Event was successfully made archived.' }
        format.json { head(:no_content) }
      end
    else 
      redirect_to "/events", error: "Only Admins and Officers can delete events."
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:Title, :Description, :Date, :Time, :Location, :Points, :type_id)
  end
end
