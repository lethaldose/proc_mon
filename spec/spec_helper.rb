require 'bundler'
Bundler.require :default, :test
ENV['RACK_ENV'] ||= 'test'

spec_root = File.expand_path(File.dirname(__FILE__))
$: << spec_root

Dir[File.join(spec_root, '..', 'lib', '*.rb')].each do |f|
  require f
end


require 'json'
