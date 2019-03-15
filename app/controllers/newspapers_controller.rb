class NewspapersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end

  def show
    @new_picture = Picture.new
    @tribe = current_user.tribe
    @newspaper = @tribe.newspapers.last
  end

  def box_photo
      pic = Picture.find params[:picture_id]
      pic.update(box_id: params[:box_id])
    end
end
