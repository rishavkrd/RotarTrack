# TODO: FIX THIS DISGUSTING BAND-AID FIX. SECRET KEY IS IN PLAINTEXT!!!!! 

Rails.application.config.auth0 = Rails.application.config_for(:auth0)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'giksZR9ko8z8SrwI6Y8RolkR0SaySMJO',
    'MUAmyw9XWkeIGk-rSUELQTbwDupvLVhLY3Zj-7R-UT1X8pG4irYqE6UqiaGkSZZ7',
    'rotartrack.us.auth0.com',
    callback_path: '/auth/auth0/callback',
    authorize_params: {
      scope: 'openid profile email'
    }
  )
end