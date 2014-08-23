module Ye
  class Track
    attr_reader :id, :title, :spotify_id, :anger
    def initialize(args)
      @id = args["id"]
      @title = args["title"]
      @spotify_id = args["spotify_id"]
      @anger = args["min_anger"]
    end
  end
end
