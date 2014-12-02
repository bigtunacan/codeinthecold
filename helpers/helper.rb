def reset_session
  session[:user] = nil
  session[:password] = nil
end

def vars
  user = $DB[:users][:username => session[:user]]
  # TODO: Come back to this later if we still need it
  #$config[:role] = user[:role] if user
  #$config
end

helpers do
  def admin_logout_button 
    user = $DB[:users][:username => session[:user]]
    if user && user[:role] == "admin"
      return ""
    else
      "dropdown-toggle"
    end
  end

  def role
    user = $DB[:users][:username => session[:user]]
    if user
      return user[:role]
    else
      nil
    end
  end
end
