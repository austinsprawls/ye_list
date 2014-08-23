
module Ye
  class GeneratePlaylist
    def self.run(params)
      client = Spotify::Client.new
      track_ids = Ye.db.get_track_ids_by_emotion(params[:emotion])
      json_tracks = client.tracks(track_ids)

      {success?: true, tracks: json_tracks }
    end
  end
end
