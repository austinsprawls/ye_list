require 'sinatra/activerecord'

module Ye
  module Databases
    class SQL
      class Track < ActiveRecord::Base
      end

      def get_track_ids_by_emotion(emotion)
        Track.where("min_anger = ? OR max_anger = ?", emotion, emotion).spotify_ids
      end
    end
  end
end
