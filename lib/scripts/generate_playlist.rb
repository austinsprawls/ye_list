require 'rspotify'

module Ye
  class GeneratePlaylist
    def self.run(params)
      track_ids = Ye.dbi.get_track_ids_by_emotion(params[:emotion])
      # json_tracks = RSpotify::Track.find(track_ids)

      {success?: true, tracks: track_ids }
    end
  end
end
