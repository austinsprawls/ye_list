module Ye
  def self.db
    @__db_instance
  end

  def self.db=(database)
    @__db_instance = database
  end
end

require_relative './databases/sql.rb'
require_relative './entities/track.rb'
require_relative './scripts/yelist.rb'
