class RoomsController < ApplicationController
  # before_action :authenticate_user!

  def create
    @room = Room.create
    @entry1 = RoomUser.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = RoomUser.create(params.require(:room_user).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if RoomUser.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.room_users
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def join_room_params
    params.require(:room_user).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end
