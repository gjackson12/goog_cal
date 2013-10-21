module ApplicationHelper

  def current_user
    user = User.where(uid: session[:uid]).first
    return user
  end

  def log_out

  end
  
end
