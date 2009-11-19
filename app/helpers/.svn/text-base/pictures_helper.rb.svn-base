module PicturesHelper

  def picture_page picture
    "/pictures/#{picture.id}"
  end
  def picture_card picture
    link_to image_tag(picture.image.public_filename(:thumb)), picture_page(picture)
  end
end
