require 'sinatra'
require './event_worker'

post '/event' do
  EventWorker.perform_async(params[:event], params[:data])
end