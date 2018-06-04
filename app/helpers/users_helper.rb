module UsersHelper

  def logged_in?
    !!current_user
  end
end
