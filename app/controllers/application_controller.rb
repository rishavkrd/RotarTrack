# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def get_user_email # rubocop:todo Naming/AccessorMethodName, Style/InlineComment
    @user = session[:userinfo]
    email = @user['email'] # rubocop:todo Lint/UselessAssignment, Style/InlineComment
  end
end
