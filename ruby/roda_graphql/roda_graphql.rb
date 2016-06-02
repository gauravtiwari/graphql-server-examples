require './api/schema'

Dotenv.load

class RodaGraphql < Roda
  use Rack::Session::Cookie, key: ENV['RACK_COOKIE_KEY'], secret: ENV['RACK_COOKIE_SECRET']
  plugin :environments
  self.environment = ENV['ENVIRONMENT']

  plugin :csrf, raise: true
  plugin :flash
  plugin :json
  plugin :json_parser
  plugin :render, engine: 'erb'
  plugin :assets
  plugin :multi_route

  require './assets/assets'

  require './api/routes/main.rb'
  Dir['./routes/*.rb'].each{|f| require f}
end
