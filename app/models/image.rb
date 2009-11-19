class Image < ActiveRecord::Base
  has_one :picture

  has_attachment  :content_type => :image,
                  :storage => :file_system,
                  :max_size => 6.megabytes,
                  :path_prefix => 'public/pictures',
                  :thumbnails => {:thumb => '128x128>', :frame => '800x600>'}


  validates_as_attachment

end
