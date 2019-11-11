class Images::EmbroideriesController < ApplicationController
  def index
    @embroideries = Image.where(category: :embroidery)
  end
end
