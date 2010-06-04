ActionView::Helpers::UrlHelper.class_eval do
  include AnalyticsPusher::UrlHelpers
end

ActionView::Helpers.class_eval do
  include AnalyticsPusher::Helpers
end

ActionController::Base.class_eval do
  include AnalyticsPusher::Actions
end
