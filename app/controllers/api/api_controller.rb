class API::APIController < ApplicationController
  protect_from_forgery with: :null_session

  def api_current_user
    @api_user ||= User.find_by_api_key(params[:key]) if !params[:key].nil?
  end

  def api_editable?
    @api_editable ||= user_editable? @model, api_current_user
  end

# This appears to be causing double-render problems in some circumstances
  # rescue_from Exception do |e|
  #     error = {error: e.message}
  #     error[:stack_trace] = e.backtrace if Rails.env.development?
  #     render json: error, status: 500
  # end

  protected
  def api_authenticate_user!
    if api_current_user.nil?
      render json: {error: "Could not find account associated with API key"}, status: 403
    end
  end

  def ensure_api_editable
    unless api_editable?
      render json: {error: "User not authorized to modify that resource"}, status: 403
    end
  end
end