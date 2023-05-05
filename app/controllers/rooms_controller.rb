class RoomsController < ApplicationController
  def create
    @user1 = User.find(params[:current_user_id])
    @user2 = User.find(params[:user_id])
    @room = Room.joins(:user_rooms).where(user_rooms: { user_id: [@user1.id, @user2.id] }).group(:id).having('count(*) = 2').first
    if @room.nil?
      @room = Room.create(user_id: @user1.id)
      UserRoom.create(user_id: params[:user_id], room_id: @room.id)
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
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
