require 'sinatra/activerecord'

if ENV['APP_ENV'] == 'development'
  Ye.db = Ye::Databases::SQL.new
else
  # Ye.db = Ye::Databases::InMemory.new
end

# TODO: ESTABLISH ACTIVE RECORD CONNECTION
ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database  => "yelist"
)
