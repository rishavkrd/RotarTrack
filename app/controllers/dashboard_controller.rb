# frozen_string_literal: true

class DashboardController < ApplicationController
  include Secured
  def show
    @user = session[:userinfo]
    @uid = session[:useruuid]
    @events = Event.all
    usr_email = @user['email']
    @account = Account.find_by uuid: session[:useruuid]
    
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
