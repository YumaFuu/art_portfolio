class Images::IllustrationsController < ApplicationController
  def index
    @images = Image.where(category: :illustration)
  end
end
