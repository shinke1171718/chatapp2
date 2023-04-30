class UsersController < ApplicationController
  def show
    @user = User.where(id: current_user.id)
    @users = User.where.not(id: current_user.id)
  end
end
