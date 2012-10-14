require 'bundler'
Bundler.require

$: << File.dirname(__FILE__)
require 'json'
require 'slim'
require 'sass'
Dir[File.join(File.dirname(__FILE__), 'lib', '*.rb')].each do |f|
  require f
end

require 'app'

run ProcMon::App
