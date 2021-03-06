class SessionsController < ApplicationController
  def create
    @auth = request.env["omniauth.auth"]
    @token = @auth["credentials"]["token"]
    session[:uid] = @auth.uid
    session[:token] = @token
    client = Google::APIClient.new
    client.authorization.access_token = session[:token]
    service = client.discovered_api('calendar', 'v3')
    @result = client.execute(
      :api_method => service.calendar_list.list,
      :parameters => {},
      :headers => {'Content-Type' => 'application/json'})
    create_google_user
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are now logged out"
    redirect_to root_url
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
