class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to "/rooms/#{@room.id}"
  end
end


private
  def message_params
    params.require(:message).permit(:message, :room_id).merge(user_id: current_user.id)
  end