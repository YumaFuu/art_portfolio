class Images::PaintsController < ApplicationController
  def index
    @images = Image.where(category: :paint)
  end
end
