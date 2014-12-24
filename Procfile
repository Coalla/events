web: bundle exec rackup
redis: rm dump.rdb && redis-server
queue: bundle exec sidekiq -r ./sidekiq.rb