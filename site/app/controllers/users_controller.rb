class UsersController < ApplicationController
  def datasets
    @editable = true if current_user.id == params[:user_id]
  end
end
