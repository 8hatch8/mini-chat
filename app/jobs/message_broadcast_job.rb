class MessageBroadcastJob < ApplicationJob
  queue_as :default

  # ブロードキャスト処理
  def perform(message)
    # room_channel.jsのreceivedメソッドへ { message: render_message[message]（中身はビューファイル） }を送信
    ActionCable.server.broadcast "room_channel", message: render_message(message)
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: "messages/message", locals: { message: message })
    # コントローラーのアクションの制約をうけずにビューファイルをレンダリング
  end
end
