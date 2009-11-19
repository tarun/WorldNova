class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      
      t.string :name
      t.text :description

      t.belongs_to :image, :account, :location
      
      t.boolean :approved

      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
