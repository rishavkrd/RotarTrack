# frozen_string_literal: true

class PointsController < ApplicationController
  include Secured
  before_action :set_point, only: %i[show edit update destroy]
  layout "default_page"

  # GET /points or /points.json
  def index

    @current_user = Account.find_by uuid: session[:useruuid]
    unless @current_user.status_id == 1
      redirect_to "/dashboard"
    end
    @points = Point.all
  end

  # GET /points/1 or /points/1.json
  def show; end

  # GET /points/new
  def new
    @accounts = Account.all
    @current_user = @accounts.find_by uuid: session[:useruuid]
    @point = Point.new
    @account = Account.find(params[:account_id])
    unless @current_user.status_id == 2
      render 'invalid'
    end
  end

  # GET /points/1/edit
  def edit
    @accounts = Account.all
    @current_user = @accounts.find_by uuid: session[:useruuid]
    unless @current_user.status_id == 2
      render 'invalid'
    end
  end

  # POST /points or /points.json
  def create
    @point = Point.new(point_params)
    event_points = Event.find(@point.event_id).Points
    if (!@point.Points)
      @point.Points = event_points
    end
    respond_to do |format|
      if Point.find_by(event_id: @point.event_id, account_id: @point.account_id)
        format.html { redirect_back fallback_location: '/dashboard', error: 'User has already been marked present.' }
      elsif @point.save
        format.html { redirect_back fallback_location: '/dashboard', success: 'Point was successfully created.' }
        format.json { render(:show, status: :created, location: @point) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @point.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /points/1 or /points/1.json
  def update
    unless @current_user.status_id == 2
      render 'invalid'
    end
    respond_to do |format|
      if @point.update(point_params)
        format.html { redirect_to(point_url(@point), success: 'Point was successfully updated.') }
        format.json { render(:show, status: :ok, location: @point) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @point.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /points/1 or /points/1.json
  def destroy
    @accounts = Account.all
    @current_user = @accounts.find_by uuid: session[:useruuid]
    unless @current_user.status_id == 2
      render 'invalid'
    end
    @point.destroy!

    respond_to do |format|
      format.html { redirect_back fallback_location: '/dashboard', success: 'Point was successfully destroyed.' }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_point
    @point = Point.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def point_params
    params.require(:point).permit(:account_id, :event_id, :Points)
  end
end
