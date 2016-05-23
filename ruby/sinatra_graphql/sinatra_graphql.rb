class SinatraGraphql < Sinatra::Base

  set :public_folder => "public", :static => true

  get "/" do
    erb :welcome
  end
end
