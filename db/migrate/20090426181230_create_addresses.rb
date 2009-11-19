class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|

      # Postal address information
      t.string :street_1
      t.string :street_2
      t.string :street_3
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code

      # Geocoded information
      t.string :latitude # many ppl use lat
      t.string :longitude # many ppl use lng

      # other crazy information
      t.string :elevation


      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
