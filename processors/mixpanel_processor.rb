require 'mixpanel-ruby'
require './settings'

class MixpanelProcessor

  def process(name, data={})
    tracker = Mixpanel::Tracker.new(Settings::MIXPANEL_PROJECT_TOKEN)
    id = data.delete('id')
    tracker.track(id, name, data)
  end

end