class Images::PicturesController < ApplicationController
  def index
    @images = Image.where(category: :picture).order(order: :asc)
  end
end
