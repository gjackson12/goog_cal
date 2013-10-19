class User < ActiveRecord::Base

  has_many :rooms
  has_many :reservations

 def self.find_for_google_oauth(uid, email)
  user = User.where(uid: uid).first

  if user
    return user
  else
    registered_user = User.where(:email => email).first
    if registered_user
      return registered_user
    else
      user = User.create(email: email, uid: uid)
    end
  end
  user
 end

end