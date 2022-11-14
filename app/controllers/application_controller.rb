# frozen_string_literal: true

class ApplicationController < ActionController::Base
    def get_user_email
      @user = session[:userinfo]
      email = @user["email"]
      if $current_user.nil?
        $current_user = Account.find_by uuid: session[:useruuid]
      end
    end
end
