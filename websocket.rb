require 'bundler'
Bundler.require
$: << File.dirname(__FILE__)
require 'lib/process_info'

def render_proc_info
  contents = File.open("lib/views/_process_table_body.slim", "rb").read
  template = Slim::Template.new { contents }
  procs = ProcMon::ProcessInfo.all
  template.render procs, {procs:procs}
end

EventMachine::WebSocket.start(:host => "0.0.0.0", :port => 8080, :debug => true) do |ws|
  timer = nil

  ws.onopen {
    timer = EM.add_periodic_timer(5) {
      ws.send(render_proc_info)
    }
  }

  ws.onclose {
    EM.cancel_timer(timer)
    puts "WebSocket closed"
  }
  ws.onerror { |e|
    puts "Error: #{e.message}"
  }
end
