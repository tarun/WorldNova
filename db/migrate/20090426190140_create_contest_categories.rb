class CreateContestCategories < ActiveRecord::Migration
  def self.up
    create_table :contest_categories do |t|
      t.belongs_to :contest, :category

      t.timestamps
    end
  end

  def self.down
    drop_table :contest_categories
  end
end
