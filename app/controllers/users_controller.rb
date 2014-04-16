class UsersController < ApplicationController
  before_filter :find_user, only: [:show, :collections]

  private
  def find_user
    @user = User.find_by_username(params[:id])
    if @user.nil?
      render 'public/404.html', status: 404, layout: false
    end
  end
end
