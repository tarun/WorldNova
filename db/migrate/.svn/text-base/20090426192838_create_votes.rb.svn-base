class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.belongs_to :account, :picture, :contest_category
      t.boolean :chosen

      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
