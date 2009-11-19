class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|

      # Bio Information
      t.string :firstname, :lastname

      t.string :email
      
      # Affiliation Information      
      t.string :status
      
      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
