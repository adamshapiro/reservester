module UsersHelper

  def patron?
    if logged_in?
      if current_user.role=='patron'
      	true
      end
    else
      false
    end
  end

  def owner?
    if logged_in?
      if current_user.role=='owner'
      	true
      end
    else
      false
    end
  end

end
