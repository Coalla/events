require 'active_record'
require './migration/create_events_table'

class Database

  def initialize
    @environment = ENV['RACK_ENV'] || 'development'
    @config = YAML.load(File.read('config/database.yml'))
  end

  def setup
    establish_connection('database' => 'postgres', 'schema_search_path' => 'public')
    recreate_database
    establish_connection
    migrate
  end

  private

  def recreate_database
    ActiveRecord::Base.connection.drop_database(db_config['database']) rescue nil
    ActiveRecord::Base.connection.create_database(db_config['database']) rescue nil
  end

  def establish_connection(options = {})
    ActiveRecord::Base.establish_connection(db_config.merge(options))
  end

  def migrate
    CreateEventsTable.migrate(:up)
  end

  def db_config
    @config[@environment]
  end

end