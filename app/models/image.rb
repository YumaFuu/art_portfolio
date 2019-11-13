class Image < ApplicationRecord
  validates :name_jp, presence: true
  validates :name_en, presence: true
  validates :category, presence: true
  validates :image_url, presence: true

  CATEGORY_ENUM = {picture: 0, embroidery: 1, paint: 2}

  enum category: CATEGORY_ENUM
end
