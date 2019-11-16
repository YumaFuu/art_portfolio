class Images::IllustrationsController < ApplicationController
  def index
    @images = Image.where(category: :illustration).order(order: :asc)
  end
end
