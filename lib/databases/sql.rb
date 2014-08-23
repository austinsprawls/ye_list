require 'pg'
require 'json'

module Ye
  class DBI
    # this initialize method is only ever run once. make sure you
    # update your `dbname`. here it is petbreeder.
    def initialize
      @db = PG.connect(host: 'localhost', dbname: 'yelist')
      build_tables
    end

    # these methods create the tables in your db if they
    # dont already exist
    def build_tables
      @db.exec(%q[
        CREATE TABLE IF NOT EXISTS tracks(
          id serial NOT NULL PRIMARY KEY,
          title varchar(30),
          spotify_id varchar(30),
          anger integer
        )])
    end

    def populate_tracks
      file = File.read("yelist.json")
      data_hash = JSON.parse(file)
      data_hash.each do |hash|
        @db.exec_params(%q[
          INSERT INTO tracks (title, spotify_id, anger)
          VALUES ($1, $2, $3);
          ], [hash["title"], hash["spotify_id"], hash["anger"]])
      end
    end

    def get_track_ids_by_emotion(emotion)
      result = @db.exec_params(%q[
        SELECT * FROM tracks
        WHERE anger=$1;
        ], [emotion])

        result.map {|track| build_track(track).spotify_id}.shuffle
    end

    def build_track(track)
      Ye::Track.new(track)
    end
  end

  # singleton creation
  def self.dbi
    @__db_instance ||= DBI.new
  end
end
