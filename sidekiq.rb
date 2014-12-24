require 'sidekiq'
require './event_worker'
require 'active_record'

Dir.glob('./models/*').each do |folder|
  Dir.glob(folder +"/*.rb").each do |file|
    require file
  end
end

# tells AR what db file to use
ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :database => 'events',
    :username => 'postgres',
    :password => 'resolve'
)