class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.belongs_to :account, :picture, :contest_category
      t.integer :level
      t.boolean :vote

      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
