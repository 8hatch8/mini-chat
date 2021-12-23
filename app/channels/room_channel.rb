class RoomChannel < ApplicationCable::Channel
  # サーバー接続時に実行
  def subscribed
    stream_from "room_channel"
  end

  # サーバー解除時に実行
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end


  def speak(data)
    # パラメータdata を受信 -> room_channel.jsのreceivedメソッドへ { message: data["message"] }を送信
    # ActionCable.server.broadcast "room_channel", message: data["message"]
    Message.create! content: data["message"]
  end
end
