$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
require 'tilt/erb'
require 'bundler'
require 'rack'
Bundler.require

require './models'
require './types'
require './schema'

config = ROM::Configuration.new(
  :sql,
  'postgres://localhost/roda_graphql'
)

config.register_relation(Users)
config.register_relation(Posts)
config.register_relation(Comments)
config.register_command(CreateUser)
config.register_command(CreatePost)
config.register_command(CreateComment)

$container = ROM.container(config)

Dotenv.load

class RodaGraphql < Roda
  use Rack::Session::Cookie, key: ENV['RACK_COOKIE_KEY'], secret: ENV['RACK_COOKIE_SECRET']
  plugin :environments
  self.environment = ENV['ENVIRONMENT']

  plugin :csrf, raise: true
  plugin :assets, css: 'some_file.scss', js: 'some_file.coffee'
  plugin :flash
  plugin :render, engine: 'erb'
  plugin :assets
  plugin :multi_route

  require './assets/assets'

  require './routes/main.rb'
  Dir['./routes/*.rb'].each{|f| require f}
end
