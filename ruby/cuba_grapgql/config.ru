$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
require 'bundler'
Bundler.require
require 'cuba/render'
require 'tilt/erb'

Cuba.plugin Cuba::Render
DataMapper::Logger.new(STDOUT, :debug, '[DataMapper] ')

# Local config
require "find"

%w{api api/types}.each do |load_path|
  Find.find(load_path) { |f|
    require f unless f.match(/\/\..+$/) || File.directory?(f)
  }
end

require 'rack/csrf'
Cuba.use Rack::Session::Cookie, secret: 'hello'
Cuba.use Rack::Csrf

require "./cuba_grapgql"

run Cuba
