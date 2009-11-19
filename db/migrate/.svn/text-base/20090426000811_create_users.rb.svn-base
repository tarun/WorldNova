require 'digest/sha2'

class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
    
      # user details
      t.string   :login,     :null => false

      # simple authentication
      t.string   :password,  :null => false
      t.string   :salt, :null => false
      
      # basic ldap support
      t.integer :auth_source, :default => 0

      # link to other models
      t.integer   :account_id
    end
  end

  def self.down
    drop_table :users
  end
end
