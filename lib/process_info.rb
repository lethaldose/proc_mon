module ProcMon
  class ProcessInfo
    PS_COMMAND ="ps -ero pid,user,pcpu,pmem,args | awk '{OFS=\"|\"; print $1,$2,$3,$4,$5}'"

    attr_reader :cpu, :mem, :user, :args, :pid

    def initialize args
      @pid, @user, @cpu, @mem, @args = *args
    end


    def to_json
      {pid: pid, user: user, cpu: cpu, mem: mem, args: args}.to_json
    end

    def self.all
      processes = IO.popen(PS_COMMAND) do |ps|
        ps.readlines
      end

      processes[1..-1].map do |pinfo|
        ProcessInfo.new(pinfo.split('|'))
      end
    end
  end

end
