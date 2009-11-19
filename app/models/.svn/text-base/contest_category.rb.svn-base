class ContestCategory < ActiveRecord::Base
  
  has_many :nominations
  has_many :ratings
  
  belongs_to :contest
  belongs_to :category

  def nominated_pictures
    self.nominations.collect {|nomination| nomination.picture}
  end

  def self.all_active
    contest_categories = Array.new
    Contest.all_running.each{|contest| contest_categories.concat(contest.contest_categories)}

    contest_categories
  end

  def name
    "#{self.contest.name} - #{self.category.name}"
  end

  def self.get_from(contest, category)
    ContestCategory.find :first, :conditions => ['contest_id = ? AND category_id = ?', contest.id, category.id]
  end
end
