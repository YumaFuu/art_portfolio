class Image < ApplicationRecord
  validates :name_jp, presence: true
  validates :name_en, presence: true
  validates :category, presence: true
  validates :image_url, presence: true
  validates :order, :uniqueness => {:scope => :category}

  CATEGORY_ENUM = {picture: 0, embroidery: 1, illustration: 2}

  enum category: CATEGORY_ENUM
end
