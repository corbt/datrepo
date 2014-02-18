class UsersController < ApplicationController
  before_filter :find_user, only: [:show, :collections]

  helper_method :editable?

  private
  def find_user
    @user = User.find_by_username(params[:id])
    if @user.nil?
      render 'public/404.html', status: 404, layout: false
    end
  end

  def editable?
    @editable ||= (current_user == @user or current_user && current_user.admin?) ? true : false
  end
end
