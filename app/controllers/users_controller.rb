class UsersController < ApplicationController

  def show
    @user = User.find(params[:format])
    @other = User.where.not(id: current_user.id)
  end
end
