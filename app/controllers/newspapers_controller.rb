class NewspapersController < ApplicationController
  def index
  end

  def show
    @new_picture = Picture.new
  end
end
