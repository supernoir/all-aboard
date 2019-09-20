require 'sinatra'
# require 'sinatra/base'
require 'erb'
require 'sysinfo'

set :public_folder, '/views/public'
set :port, 8080

# Defines AllAboardApp as Sinatra base
class AllAboardApp < Sinatra::Base
  get '/' do
    sysinfo = SysInfo.new
    @useragent = request.user_agent
    @host = request.host
    @vm = sysinfo.vm
    @impl = sysinfo.impl
    @arch = sysinfo.arch
    @platform = sysinfo.platform
    erb :whoami
  end
end
