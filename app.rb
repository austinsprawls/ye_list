
require_relative './lib/yelist.rb'

require "sinatra"
require "sinatra/activerecord"

set :database, {adapter: "postgresql", database: "yelist"}
# set :bind, '0.0.0.0'

get '/' do
  erb :index
end

post '/' do
  response = Ye::GeneratePlaylist.run(params)
  erb :index, :locals => { :emotion => params[:emotion] }
end
