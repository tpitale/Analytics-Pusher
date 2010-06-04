module AnalyticsPusher
  module UrlHelpers
    def link_to(*args, &block)
      if block_given?
        options      = args.first || {}
        html_options = args.second
        super(options, filter_options(html_options.stringify_keys), &block)
      else
        name         = args[0]
        options      = args[1] || {}
        html_options = args[2]
        super(name, options, filter_options(html_options.stringify_keys))
      end
    end

    def button_to(name, options = {}, html_options = {})
      super(name, options, filter_options(html_options.stringify_keys))
    end

    def mail_to(email_address, name = nil, html_options = {})
      super(email_address, name, filter_options(html_options.stringify_keys))
    end

    private
    def filter_options(html_options)
      html_options['data-track-pagview'] = filter_track_pageview(html_options['track_pageview'])
      html_options['data-track-event'] = ftiler_track_event(html_options['track_event'])
      html_options
    end

    def filter_track_pageview(track_as)
      if track_as == '' || track_as === true
        # current request uri
        request.request_uri
      elsif track_as.is_a?(String)
        # value passed in
        track_as
      else
        # don't pass anything else
        nil
      end
    end

    def filter_track_event(track_array)
      # hopefully 4 elements in the array
      Array(track_array).compact.join(',')
    end
  end
end
