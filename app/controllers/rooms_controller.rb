class RoomsController < ApplicationController
  def create
    @room = Room.create(user_id: current_user.id)
    @user_room1 = UserRoom.create(room_id: @room.id, user_id: current_user.id)
    @user_room2 = UserRoom.create(user_room_params)
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if UserRoom.where(user_id: current_user.id,room_id: @room.id).present?
      @messages = @room.message
      @message = Message.new
      @user_rooms = @room.user_room
    else
      redirect_back(fallback_location: root_path)
    end
  end
end

private

def user_room_params
  params.require(:userroom).permit(:user_id, :room_id)
end
