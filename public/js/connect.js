$(function () {

  var socket = function () {

    function updateProcInfo(string) {
      var element = $("body .container table tbody");
      element.replaceWith(string);
      $('th.sort').click();
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
