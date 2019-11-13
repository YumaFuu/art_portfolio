class Images::EmbroideriesController < ApplicationController
  def index
    @images = Image.where(category: :embroidery)
  end
end
