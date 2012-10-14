module ProcMon
  class App < ::Sinatra::Base
    set :root, File.dirname(__FILE__)
    set :views, File.dirname(__FILE__) + '/lib/views'
    set :layout_engine, :slim

    get '/' do
      @procs = ProcMon::ProcessInfo.all
      slim :process_info, :locals => {:procs => @procs}
    end
  end
end
