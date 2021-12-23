class Message < ApplicationRecord
  # データ保存後にコミット -> MessageBroadcastJob の performメソッドを遅延？実行、引数self
  after_create_commit { MessageBroadcastJob.perform_later self}
end
