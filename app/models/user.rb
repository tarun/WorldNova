require 'digest/sha2'

class User < ActiveRecord::Base

  # Associations
#  has_many :user_account_affiliations
#  has_many :accounts, :through => :user_account_affiliations
   has_one :account
   belongs_to :account

  validates_presence_of :login, :password
  validates_uniqueness_of :login
  #validates_length_of :login, :is => '3'
  

  # Conditions
   before_save :create_salt
   before_save :hash_password

  

  def name
    login
  end

  def User.validate(login, password)
    user = User.find_by_login login
    ( user and user.validate_password(password) ) ? user : nil
  end
  
   def validate_password password
     self.password.eql? self.hash_data(password, self.salt)
   end

   protected 
 
   def hash_data(data, salt = "")
     Digest::MD5.hexdigest("#{data}#{salt}")
   end

   def create_salt
     self.salt = self.hash_data("#{Time.now}#{self.login}")
   end

   def hash_password
     self.password = self.hash_data(self.password, self.salt)
   end
   
end
