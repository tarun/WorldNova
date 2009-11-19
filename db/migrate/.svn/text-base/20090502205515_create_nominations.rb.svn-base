class CreateNominations < ActiveRecord::Migration
  def self.up
    create_table :nominations do |t|
      t.belongs_to :picture, :contest_category, :nominator
      t.string :status
      t.boolean :approved
      t.timestamps
    end
  end

  def self.down
    drop_table :nominations
  end
end
