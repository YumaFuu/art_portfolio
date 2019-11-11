class Images::PicturesController < ApplicationController
  def index
    @pictures = Image.where(category: :picture) 
  end
end
