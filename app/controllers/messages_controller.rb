class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:alret] = "投稿に成功しました。"
      redirect_to "/rooms/#{@message.id}"
    else
      flash[:alret] = "投稿に失敗しました。"
      redirect_to "/rooms/#{@message.id}"
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :room_id).merge(user_id: current_user.id)
  end
end
