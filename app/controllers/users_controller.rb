class UsersController < ApplicationController
  def show
    def roomcreate
      @user = User.find(params[:format])
      @other = User.where.not(id: @user.id)
      binding.pry
      unless @user.id == @other.user.id
        puts "aaaaa"
        if @room.nil?
          @room = Room.new()
          @user_room = User_room.new(@other.user.id)
        end
      end
    end
  end
end
