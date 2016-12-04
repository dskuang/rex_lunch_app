class Restaurant < ActiveRecord::Base
  include CloudStorage

  validates_presence_of :name, :photo_link, :banner_link

  has_many :food_items

  before_save :cloudinary_photo_upload, if: :photos_changed?

  def available_food_items
    food_items.where(disabled: false)
              .order('side_dish ASC, vegetarian ASC, name DESC')
  end

  private

  def photos_changed?
    photo_link_changed? || banner_link_changed?
  end

  def cloudinary_photo_upload
    self.photo_link = CloudStorage.uploaded_url(photo_link)
    self.banner_link = CloudStorage.uploaded_url(banner_link)
  end
end
