require 'sidekiq'
require './processors'

class EventWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3

  def perform(event, data={})
    logger.info("Event \"#{event}\" registered. Data: #{data}")

    Processors.instances.each do |handler|
      handler.process(event, data)
    end
  end
end