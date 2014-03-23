class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    user_path(params[:user][:username])
  end

  def after_inactive_sign_up_path_for(resource)
    after_sign_up_path_for resource
  end
end
