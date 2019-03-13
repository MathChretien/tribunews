class PicturesController < ApplicationController

  def index

  end

  def create
    puts ">>>>>>"+current_user.tribe.current_newspaper.id
    # newspaper = current_user.tribe.newspaper
    # @new_picture = Picture.create!(picture_params)
    raise
  end

  private

  def picture_params
    params.require(:picture).permit(:box_id, :newspaper_id, :photo, :created_at, :updated_at)
  end

end

