require 'active_record'
class CreateEventsTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :name
      t.text :data

      t.timestamps
    end
  end
end