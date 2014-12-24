require './models/event'
class DbProcessor
  def process(event, data={})
    Event.create!(name: event, data: data.to_s)
  end
end