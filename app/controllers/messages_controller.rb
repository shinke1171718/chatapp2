class MessagesController < ApplicationController
  def create
    @message = Message.create(message_params)
    redirect_to "/rooms/#{@message.id}"
  end

  private
  def message_params
    params.require(:message).permit(:message, :room_id).merge(user_id: current_user.id)
  end
end
