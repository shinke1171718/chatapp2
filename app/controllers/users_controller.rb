class UsersController < ApplicationController
  def show
    @user = User.find(params[:format])
    @current_user_room = User_room.where(user_id: current_user.id)
  end
end
