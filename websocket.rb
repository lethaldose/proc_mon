require 'bundler'
Bundler.require
$: << File.dirname(__FILE__)
require 'lib/process_info'

EventMachine::WebSocket.start(:host => "0.0.0.0", :port => 8080, :debug => true) do |ws|
  timer = nil

  ws.onopen {
    puts "Ping supported: #{ws.pingable?}"
    timer = EM.add_periodic_timer(10) {
      p ["Sent ping", ws.ping('hello')]
      ws.send(ProcMon::ProcessInfo.all.join("<br>"))
    }
  }
  ws.onpong { |value|
    puts "Received pong: #{value}"
  }
  ws.onping { |value|
    puts "Received ping: #{value}"
  }
  ws.onclose {
    EM.cancel_timer(timer)
    puts "WebSocket closed"
  }
  ws.onerror { |e|
    puts "Error: #{e.message}"
  }
end
