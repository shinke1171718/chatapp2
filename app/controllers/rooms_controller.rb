class RoomsController < ApplicationController
  def create
    @room = Room.find_by(current_user_id: current_user.id, user_id: params[:user_id])
    if @room.nil?
      @room = Room.create(current_user_id: current_user.id, uesr_id: user.id)
      flash[:now] = "新しくROOMを作成しました。"
      redirect_to "/rooms/#{@room.id}"
    else
      flash[:now] = "ROOM作成に失敗しました。"
      redirect_to "/rooms/#{@room.id}"
    end
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.where.not(content: nil)
    @message = Message.new
  end
end
