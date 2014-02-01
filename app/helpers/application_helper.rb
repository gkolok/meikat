module ApplicationHelper
  def logged_in?
    not request.authorization.nil?
  end

  def user_is_admin?
    logged_in? && session[:role] == :admin
  end

  def user_is_librarian?
    logged_in? && session[:role] == :librarian
  end
end
