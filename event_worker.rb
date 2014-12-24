require 'sidekiq'
require './processors'
require 'json'

class EventWorker
  include Sidekiq::Worker

  def perform(event, data={})
    Processors.instances.each do |handler|
      handler.process(event, JSON.parse(data))
    end
  end

end