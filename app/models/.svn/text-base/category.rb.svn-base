class Category < ActiveRecord::Base
  has_many :contest_categories
  has_many :contests, :through => :contest_categories

  def nominated_pictures
    pictures = Array.new
    self.contest_categories.each{ |contest_category| pictures.concat(contest_category.nominated_pictures) }
    # return all pictures
    pictures
  end
  #has_many :nominations, :through => :contest_categories
end
