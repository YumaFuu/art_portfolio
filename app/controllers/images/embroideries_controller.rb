class Images::EmbroideriesController < ApplicationController
  def index
    @images = Image.where(category: :embroidery).order(order: :desc)
  end
end
