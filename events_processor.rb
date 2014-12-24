require 'sinatra'
require './event_worker'

get '/event' do
  EventWorker.perform_async(params[:event], params[:data])
end