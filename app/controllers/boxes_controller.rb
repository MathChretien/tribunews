class BoxesController < ApplicationController

  def index
  end

  def show
  end

  def edit
  end

  def update
    @box = Box.find(params[:id])
    # TODO Test if category text stays text and pic stays pic
    @box.update!(update_params)
    render "newspapers/show"  # TODO AAARG where to go!? think this has to become newspaper_show, but not implemented yet
  end

  private
  def update_params
    params.require(:box).permit(:content_text, :category, :content_text)
  end

end
