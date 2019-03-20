class MessagesController < ApplicationController
  def create
    @message = Message.new(white_params)
    @message.user = current_user
    @message.save!
    redirect_to tribe_path(current_user.tribe)
  end

  private

  def white_params
    params.require(:message).permit(:message)
  end

end
