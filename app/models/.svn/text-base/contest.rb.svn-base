class Contest < ActiveRecord::Base    
  has_many :contest_categories
  has_many :categories, :through => :contest_categories

#  has_many :nominations, :through => :contest_categories

  # Running contests
  def self.all_running
    Contest.all :conditions => ['begin < ? AND end > ?', Time.now, Time.now]
  end

  def nominated_pictures
    pictures = Array.new
    self.contest_categories.each{ |contest_category| pictures.concat(contest_category.nominated_pictures) }
    # return all pictures
    pictures
  end
end
