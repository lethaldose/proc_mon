$(function () {

  var socket = function () {

    function updateProcInfo(string) {
      var element = $("body");
      element.html(string);
    }

    var Socket = "MozWebSocket" in window ? MozWebSocket : WebSocket;
    var ws = new Socket("ws://localhost:8080/");
    ws.onmessage = function(evt) {
      console.log("Message: " + evt.data);
      updateProcInfo(evt.data);
    };
    ws.onclose = function() {
      console.log("socket closed");
    };
    ws.onopen = function() {
      console.log("connected...");
    };
  }

  socket();
});
