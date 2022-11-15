# frozen_string_literal: true

class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :success
    def get_user_email
      @user = session[:userinfo]
      email = @user["email"]
    end
end
