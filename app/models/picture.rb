class Picture < ActiveRecord::Base  
  belongs_to :image
  belongs_to :account
  belongs_to :location

  has_many :nominations
  has_many :ratings

 # acts_as_taggable_on :tags #, :pictures#, :photos#graphy

  accepts_nested_attributes_for :image, :allow_destroy => true

  def self.all_paginated(page)
    paginate :page => page,
             :per_page => 6,
             :order => 'created_at DESC'
  end
end
