class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def show
    @images = Image.find(params[:id])
  end

end

