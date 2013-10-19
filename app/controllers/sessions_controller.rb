class SessionsController < ApplicationController
  def create
    @auth = request.env["omniauth.auth"]
    @token = @auth["credentials"]["token"]
    session[:uid] = @auth.uid
    session[:token] = @token
    binding.pry
    client = Google::APIClient.new
    client.authorization.access_token = session[:token]
    service = client.discovered_api('calendar', 'v3')
    @result = client.execute(
      :api_method => service.calendar_list.list,
      :parameters => {},
      :headers => {'Content-Type' => 'application/json'})
    binding.pry
    create_google_user
  end

  protected

  def create_google_user
    @user = User.find_for_google_oauth(@auth.uid, @auth.info.email )

    if @user.persisted? 
      redirect_to reservations_path
    else
      redirect_to root_path
      flash[:notice] = "There was a problem signing you in. Please try again."
    end
  end
end
