class DashboardController < ApplicationController
    include Secured
    def show
      @user = session[:userinfo]
      @events = Event.all
    end
    def help
    end
  end