class RoomsController < ApplicationController
  def create
    @room = Room.find_by(current_user_id: current_user.id, user_id: params[:user_id]) || @room = Room.find_by(current_user_id: params[:user_id], user_id: current_user.id)
    if @room.nil?
      @room = Room.create(current_user_id: current_user.id, user_id: params[:user_id])
      flash[:now] = "新しくROOMを作成しました。"
      redirect_to "/rooms/#{@room.id}"
    else
      redirect_to "/rooms/#{@room.id}"
    end
  end


  def show
    @user = User.where(id: current_user.id)
    @users = User.where.not(id: current_user.id)
    @room = Room.find(params[:id])
    @messages = @room.messages.where.not(content: nil)
    @message = Message.new
  end
end
