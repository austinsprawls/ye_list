require "sinatra"
require "sinatra/activerecord"

set :database, {adapter: "postgresql", database: "yelist"}
