module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in_and_current_user?(user)
    logged_in? && current_user?(user)
  end

  def logged_in_and_is_teacher?(user)
    logged_in? && (user.is_teacher?)
  end
end
