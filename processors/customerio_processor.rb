require 'customerio'
require './settings'

class CustomerioProcessor

  def process(name, data={})
    customerio = Customerio::Client.new(Settings::CUSTOMER_IO_ID, Settings::CUSTOMER_IO_API_KEY)
    id = data.delete('id')
    customerio.identify(id: id)
    customerio.track(id, name, data)
  end

end