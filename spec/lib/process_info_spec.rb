require 'spec_helper'

describe ::ProcMon::ProcessInfo do
  it 'should return a list of processes' do
    IO.should_receive(:popen).with(ProcMon::ProcessInfo::PS_COMMAND).and_return(['header', 'dummy proc'])
    ProcMon::ProcessInfo.all.size.should == 1
  end

  it 'should intialize process info' do
    pi = ProcMon::ProcessInfo.new [1,2,3,4,5]
    pi.pid.should == 1
    pi.user.should == 2
    pi.cpu.should == 3
    pi.mem.should == 4
    pi.args.should == 5
  end
  it 'should give json' do
    ProcMon::ProcessInfo.new([1,2,3,4,5]).to_json.should == "{\"pid\":1,\"user\":2,\"cpu\":3,\"mem\":4,\"args\":5}"
  end
end
