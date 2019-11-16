class Images::PicturesController < ApplicationController
  def index
    @images = Image.where(category: :picture).order(order: :desc)
  end
end
