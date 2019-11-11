class Image < ApplicationRecord
  validates :name_jp, presence: true
  validates :name_en, presence: true
  validates :category, presence: true
  validates :image_file, presence: true


  CATEGORY_ENUM = {picture: 0, embroidery: 1}

   mount_uploader :image_file, ImageUploader
   enum category: CATEGORY_ENUM
end
