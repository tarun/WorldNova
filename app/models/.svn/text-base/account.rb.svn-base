class Account < ActiveRecord::Base
  # The actual account, abstracted beyond authentication

  # Associations
#  has_many :user_account_affiliations
#  has_many :users, :through => :user_account_affiliations
   has_many :users
  
  has_many :pictures
  has_many :ratings
  has_many :nominations, :through => :pictures

  def full_name
    "#{firstname} #{lastname}"
  end
end
