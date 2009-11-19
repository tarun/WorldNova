class CreateUserAccountAffiliations < ActiveRecord::Migration
  def self.up
    create_table :user_account_affiliations do |t|
      t.belongs_to :user
      t.belongs_to :account
      
      t.timestamps
    end
  end

  def self.down
    drop_table :user_account_affiliations
  end
end
