require "sinatra"
# require "sinatra/activerecord"
# require "active_record"

set :database, {adapter: "postgresql", database: "yelist"}
set :bind, '0.0.0.0'

get '/' do
  erb :index
end

post '/' do
  @emotion = params[:emotion]
  erb :index
end
