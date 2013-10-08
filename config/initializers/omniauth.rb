Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "315344085152.apps.googleusercontent.com", 'IZI5pJeT2NfIUzMErhf10MWQ', {
    access_type: 'offline',
    scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar',
    redirect_uri:'http://localhost:3000/auth/google_oauth2/callback'
  }
end

