# frozen_string_literal: true

module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?
  end

  def logged_in_using_omniauth?
    redirect_to('/') if session[:userinfo].blank?
    if session[:userinfo].present?
      @user = session[:userinfo]
      user_email = @user['email']
      user_uid = session[:useruuid]
      user = Account.find_by(uuid: user_uid)
      redirect_to('/profile/create') unless user
    end
  end
end
