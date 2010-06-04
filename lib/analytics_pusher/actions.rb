module AnalyticsPusher
  module Actions
    def track_pageview(track_as)
      @_pageview_to_track = track_as.to_s
    end

    def track_pageview?
      !@_pageview_to_track.nil?
    end

    def track_event(*track_array)
      @_event_to_track = track_array.compact.map(&:to_s).join(',')
    end

    def track_event?
      !@_event_to_track.nil?
    end
  end
end
