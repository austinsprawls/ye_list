
require_relative 'lib/yelist.rb'

require "sinatra"

# set :database, {adapter: "postgresql", database: "yelist"}
set :bind, '0.0.0.0'

get '/' do
  erb :index
end

post '/' do
  @emotion = params[:emotion]
  response = Ye::GeneratePlaylist.run(params)
  if response[:success?]
    @json_tracks_array = response[:tracks]
  end
  erb :index
end
