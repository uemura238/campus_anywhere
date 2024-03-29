class MessagesController < ApplicationController
  # before_action :authenticate_user!

  def create
    if RoomUser.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :content,
                                                                :room_id).merge(user_id: current_user.id))
    else
      flash[:alert] = 'メッセージ送信に失敗しました。'
    end
    redirect_to "/rooms/#{@message.room_id}"
  end
end
