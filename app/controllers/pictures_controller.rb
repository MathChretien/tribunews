class PicturesController < ApplicationController

  def index

  end

  def create
    # puts current_user.tribe.current_newspaper.id
    @newspaper = current_user.tribe.current_newspaper
    new_params = picture_params
    new_params[:newspaper] = @newspaper
    @picture = Picture.create!(new_params)
    if @picture.save!
      redirect_to newspapers_show_path
    else
      render :newspapers_show
    end

  end

  private

  def picture_params
    params.require(:picture).permit(:box_id, :newspaper_id, :photo, :photo_cache, :created_at, :updated_at)
  end

end

