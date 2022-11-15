# frozen_string_literal: true

class DashboardController < ApplicationController
  include Secured
  layout "default_page"
  def show
    $current_user = Account.find_by uuid: session[:useruuid]
    @user = session[:userinfo]
    @uid = session[:useruuid]
    @events = Event.where("? >= ?",:Date, Time.now).order(:Date).limit(3)
    usr_email = @user['email']
    @account = Account.find_by uuid: session[:useruuid]
    @mypoints=Point.where(account_id: @account.id)
    @total_points = @mypoints.all.sum (:Points)
    @current_user = @account
    @registered_events = Signup.where(account_id: @account.id).size
    
    # respond_to do |format|
    # if @account==nil
    #   redirect_to new_account_path, notice: "New Account was successfully added."
  end
  def greeting
    current_time = Time.now.to_i
    midnight = Time.now.beginning_of_day.to_i
    noon = Time.now.middle_of_day.to_i
    five_pm = Time.now.change(:hour => 17 ).to_i
    eight_pm = Time.now.change(:hour => 20 ).to_i
    case 
      when midnight.upto(noon).include?(current_time)
        return "Good Morning"
      when noon.upto(five_pm).include?(current_time)
        return  "Good Afternoon"
      when five_pm.upto(eight_pm).include?(current_time)
        return "Good Evening"
      when eight_pm.upto(midnight + 1.day).include?(current_time)
        return "Good Night"
    end
  end
  helper_method :greeting
  

  def help; end
end
