class FoodItem < ActiveRecord::Base
  include CloudStorage

  before_save :cloudinary_photo_upload, if: :photo_link_changed?
  DEFAULT_IMG = 'http://res.cloudinary.com/rexeats/image/upload/v1480020303/food_ubfu0z.png'.freeze

  def parsed_name
    if name.length > 23
      "#{name[0..23]}.."
    else
      name
    end
  end

  private

  def cloudinary_photo_upload
    self.photo_link =
      photo_link.present? ? CloudStorage.uploaded_url(photo_link) : DEFAULT_IMG
  end
end
