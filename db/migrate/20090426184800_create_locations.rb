class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.belongs_to :address
      t.belongs_to :place

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
