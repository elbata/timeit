class CreateRegistries < ActiveRecord::Migration
  def self.up
    create_table :registries do |t|
      t.integer :week
      t.integer :day
      t.float :hours
      t.integer :user_id

      t.time :start
      t.time :stop
      t.integer :task_id

      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :registries
  end
end
