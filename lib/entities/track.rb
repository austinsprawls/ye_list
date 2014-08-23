module Ye
  class Track
    attr_reader :id, :title, :spotify_id, :min_anger, :max_anger
    def initialize(args)
      @id = args[:id]
      @title = args[:title]
      @spotify_id = args[:spotify_id]
      @min_anger = args[:min_anger]
      @max_anger = args[:max_anger]
    end
  end
end
