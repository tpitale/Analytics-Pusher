(function ($) {
  // pageview/event values pushed from controller
  var track_pageview = $('meta[name=track-pageview]').attr('content'),
      track_event = $('meta[name=track-event]').attr('content');

  if(track_pageview !== undefined) {
    // always track to a page if pushed from controller
    _gaq.push('_trackPageview', track_pageview);
  }

  if(track_event !== undefined) {
    track_array = track_event.split(',');
    _gaq.push('_trackEvent', track_array[0], track_array[1], track_array[2], track_array[3]);
  }

  // link_to '', '', :track_pageview => true or '/articles/1' OR button_to/mail_to
  $('a[data-track-pageview],button[data-track-pageview]').live('click', function() {
    var track_as = $(this).attr('data-track-pageview');

    if(track_as == '' || track_as == 'true') {
      _gaq.push('_trackPageview');
    } else {
      _gaq.push('_trackPageview', track_as);
    }
  });

  // link_to '', '', :track_event => [1,2,3,4] OR button_to/mail_to
  $('a[data-track-event],button[data-track-event]').live('click', function() {
    var track_array = $(this).attr('data-track-pageview').split(',');
    _gaq.push('_trackEvent', track_array[0], track_array[1], track_array[2], track_array[3]);
  });
})(jQuery);
