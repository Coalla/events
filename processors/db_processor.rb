require './models/event'
require './processors/database'

class DbProcessor

  def self.assert_database
    unless @database
      @database = Database.new
      @database.setup
    end
  end

  def initialize
    DbProcessor.assert_database
  end

  def process(event, data={})
    Event.create!(name: event, data: data.to_s)
  end

end