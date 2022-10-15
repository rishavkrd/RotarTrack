module Secured
    extend ActiveSupport::Concern
  
    included do
      before_action :logged_in_using_omniauth?
    end
  
    def logged_in_using_omniauth?
      redirect_to '/' unless session[:userinfo].present?
      if session[:userinfo].present?
        @user = session[:userinfo]
        user_email = @user["email"]
        user = Account.find_by(Email: user_email)
        unless user
          redirect_to '/profile/create'
          end
      end
    end
end