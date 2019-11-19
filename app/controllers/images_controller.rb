class ImagesController < ApplicationController
  def index(category)
    @images = Image.where(category: category).ordered
  end
end
