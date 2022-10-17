# frozen_string_literal: true

class ApplicationController < ActionController::Base
    def get_user_email
      @user = session[:userinfo]
      email = @user["email"]
    end
end
