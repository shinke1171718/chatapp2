class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.where.not(id: current_user.id)
  end
end
