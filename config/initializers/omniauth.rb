if Rails.env.development?
  @redirect_uri = 'http://localhost:3000/auth/google_oauth2/callback'
else
  @redirect_uri = 'http://goog-cal.herokuapp.com/auth/google_oauth2/callback'
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], {
    access_type: 'offline',
    scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar',
    redirect_uri: @redirect_uri
  }
end

