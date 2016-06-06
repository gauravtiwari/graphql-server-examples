# Inject authorization token for root route
# Because we don't have it
# For real app you would use generally some kind of authentication

class PassAuthToken
  def initialize(app)
    @app = app
  end

  def call(env)
    data = {user_id: 1} # Anything you want to encode
    token = Rack::JWT::Token.encode(data, ENV['RACK_COOKIE_SECRET'], 'HS256')
    if env['REQUEST_PATH'] == '/'
      env['HTTP_AUTHORIZATION'] = "Bearer #{token}"
    end
    @app.call(env)
  end
end
