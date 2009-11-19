class CreateContests < ActiveRecord::Migration
  def self.up
    create_table :contests do |t|
      t.string :name
      t.text :description, :rules

      t.boolean :ratings, :votes # using ratings or votes or both to determine winner

      t.datetime :begin, :end

      t.timestamps
    end
  end

  def self.down
    drop_table :contests
  end
end
