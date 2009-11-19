class Nomination < ActiveRecord::Base
  belongs_to :picture
  belongs_to :contest_category #, :include => [:contest, :category]
  belongs_to :nominator, :class_name => :account 
end
