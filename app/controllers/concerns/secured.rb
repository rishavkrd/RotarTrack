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
      user_by_email = Account.find_by(Email: user_email)
      if user
        $current_user = Account.find_by(uuid: session[:useruuid] # rubocop:todo Style/GlobalVars)
      elsif user_by_email
        user_by_email.uuid = user_uid
        user_by_email.save!
      else
        redirect_to('/profile/create')
      end
    end
  end
end
