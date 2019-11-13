class Images::PicturesController < ApplicationController
  def index
    @images = Image.where(category: :picture)
  end
end
