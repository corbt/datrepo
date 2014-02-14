class UsersController < ApplicationController
  before_filter :find_user, only: [:show]

  helper_method :editable?

  def datasets
    @editable = true if current_user.id == params[:user_id]
  end

  def show
  end

  private
  def find_user
    @user = User.find_by_username(params[:id])
  end

  def editable?
    @editable ||= (current_user == @user or current_user && current_user.admin?) ? true : false
  end
end
