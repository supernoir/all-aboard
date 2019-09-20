require 'sinatra'
require 'erb'

set :public_folder, '/views/public'
set :port, 8080


get '/' do
  @useragent = request.user_agent
  @host = request.host
  erb :whoami
end

