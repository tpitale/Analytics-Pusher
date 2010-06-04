require 'rails/generators'

class PusherGenerator < Rails::Generators::Base
  def install_pusher
    copy_file('analytics_pusher.js', 'public/javascripts/analytics_pusher.js')
  end

  def self.source_root
    File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
  end
end
