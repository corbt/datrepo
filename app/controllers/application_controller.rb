class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :user_path
  helper_method :editable?

  def user_path(user)
    return "/users/#{user.username}" if user.is_a? User
    return "/users/#{user}"
  end

  # Devise methods
  before_filter :configure_permitted_parameters, if: :devise_controller?

  after_filter :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    if (request.fullpath != "/users/sign_in" &&
        request.fullpath != "/users/sign_up" &&
        request.fullpath != "/users/password" &&
        request.fullpath != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  def after_sign_in_path_for(resource_or_scope)
    session[:previous_url] || user_path(current_user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :email
    # devise_parameter_sanitizer.for(:sign_in) << :username
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :current_password)
    end
  end

  def editable? model
    @editable ||= user_editable? model, current_user
  end

  def user_editable? model, user
    @user_editable ||= (user == model.user or user && user.admin?) ? true : false
  end
end
