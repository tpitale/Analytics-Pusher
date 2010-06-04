module AnalyticsPusher
  module Helpers
    # Returns a meta tag with the request forgery protection token for forms to use. Put this in your head.
    def analytics_pusher_meta_tag
      meta_tags = ""
      meta_tags << %(<meta name="track-pageview" content="#{Rack::Utils.escape_html(@_pageview_to_track)}" />) if track_pageview?
      meta_tags << %(<meta name="track-event" content="#{Rack::Utils.escape_html(@_event_to_track)}" />) if track_event?
      meta_tags.html_safe
    end
  end
end
