require './processors/mixpanel_processor'
require './processors/customerio_processor'
require './processors/db_processor'
class Processors
  def self.instances
    @handlers ||= [DbProcessor.new, CustomerioProcessor.new, MixpanelProcessor.new]
  end
end