web: bundle exec rackup
redis: rm -f dump.rdb && redis-server
queue: bundle exec sidekiq -r ./sidekiq.rb -L events.log