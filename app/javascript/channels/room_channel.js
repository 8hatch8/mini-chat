import consumer from "./consumer"

function something() {
// appRoomに代入
const appRoom = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // return alert(data["message"]) // データ受信時にアラートとしてメッセージを表示
    const messages = document.getElementById("messages");
    messages.insertAdjacentHTML("beforeend", data["message"]);
  },

  // room_channel.rbのspeakアクションへ{ message: message }を送る
  speak: function(message) {
    return this.perform('speak', { message: message });
  }
});

window.addEventListener("keypress", (e) => {

  if (e.keyCode === 13) {
    console.log("OK");
    // KeyCode13: Enterキー
    // 入力内容をspeakメソッドへ送信
    appRoom.speak(e.target.value);
    e.target.value = "";
    e.preventDefault();
  }
});
};
window.addEventListener("load", something)