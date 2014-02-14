module ApplicationHelper
  def user_path(user)
    return "/users/#{user.username}" if user.is_a? User
    return "/users/#{user}"
  end
end
