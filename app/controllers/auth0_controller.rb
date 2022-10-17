# frozen_string_literal: true

# ./app/controllers/auth0_controller.rb
class Auth0Controller < ApplicationController
  def callback
    # OmniAuth stores the information returned from Auth0 and the IdP in request.env['omniauth.auth'].
    # In this code, you will pull the raw_info supplied from the id_token and assign it to the session.
    # Refer to https://github.com/auth0/omniauth-auth0#authentication-hash for complete information on 'omniauth.auth' contents.
    auth_info = request.env['omniauth.auth']
    session[:userinfo] = auth_info['extra']['raw_info']

    find_or_create
  end

  def failure
    # Handles failed authentication -- Show a failure page (you can also handle with a redirect)
    @error_msg = request.params['message']
  end

  def logout
    reset_session
    redirect_to(logout_url)
  end

  private

  def logout_url
    request_params = {
      returnTo: root_url,
      client_id: 'giksZR9ko8z8SrwI6Y8RolkR0SaySMJO'
    }

    URI::HTTPS.build(host: 'rotartrack.us.auth0.com', path: '/v2/logout', query: request_params.to_query).to_s
  end

  def find_or_create
    info = request.env.fetch('omniauth.auth').fetch('info')
    user_email = info.fetch('email')
    user = Account.find_by(Email: user_email)

    if user
      redirect_to('/dashboard')
      user
    else
      redirect_to('/profile/create')
    end
  end
end
