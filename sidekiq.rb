require 'sidekiq'
require './event_worker'
require 'active_record'

# tells AR what db file to use
ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :database => 'events',
    :username => 'postgres',
    :password => 'resolve'
)