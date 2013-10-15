class SessionsController < ApplicationController
  def create
    #What data comes back from OmniAuth?
    @auth = request.env["omniauth.auth"]
    #Use the token from the data to request a list of calendars
    #TODO: store this token in the session
    @token = @auth["credentials"]["token"]
    session[:token] = @token
    client = Google::APIClient.new
    client.authorization.access_token = session[:token]
    service = client.discovered_api('calendar', 'v3')
    @result = client.execute(
      :api_method => service.calendar_list.list,
      :parameters => {},
      :headers => {'Content-Type' => 'application/json'})
  end
end
