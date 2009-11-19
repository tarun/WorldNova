class Rating < ActiveRecord::Base
  belongs_to :picture
  belongs_to :account
  belongs_to :contest_category
end
