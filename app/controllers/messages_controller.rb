class MessagesController < ApplicationController
  def destroy_all
    Message.destroy_all
    redirect_to root_path
  end
end
