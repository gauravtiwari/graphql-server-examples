require './api/schema'

Dotenv.load

class RodaGraphql < Roda
  use Rack::Session::Cookie, key: ENV['RACK_COOKIE_KEY'], secret: ENV['RACK_COOKIE_SECRET']
  use Rack::Protection
  use Rack::Protection::RemoteReferrer
  use PassAuthToken
  use Rack::JWT::Auth, {secret: ENV['RACK_COOKIE_SECRET'], exclude: %w(/assets), options: { algorithm: 'HS256' }}

  plugin :environments
  self.environment = ENV['ENVIRONMENT']

  plugin :flash
  plugin :json
  plugin :json_parser
  plugin :render, engine: 'erb'
  plugin :view_options
  plugin :assets
  plugin :multi_route

  require './assets/assets'

  require './api/routes/main.rb'
  Dir['./routes/*.rb'].each{|f| require f}
end
