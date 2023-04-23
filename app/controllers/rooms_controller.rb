class RoomsController < ApplicationController
  def create
    @room = Room.create(user_id: current_user.id)
    @user_room1 = UserRoom.create(room_id: @room.id, user_id: current_user.id)
    @user_room2 = UserRoom.create(room_id: @room.id, user_id: params[:id])
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    @messages = Message.where.not(:message => nil)
    @message = Message.new
    @user_rooms = @room.user_room
  end
end
