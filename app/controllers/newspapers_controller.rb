class NewspapersController < ApplicationController
  layout 'pdf', only: :pdf
  skip_before_action :verify_authenticity_token
  
  def index
  end

  def show
    @new_picture = Picture.new
    @tribe = current_user.tribe
    @newspaper = @tribe.newspapers.last
    respond_to  do |format|
      format.html
      format.pdf do
                  render pdf: "titre newspaper",
                  page_size: 'A4',
                  template: "newspapers/pdf.html.erb",
                  layout: "pdf.html",
                  lowquality: true,
                  zoom: 1,
                  dpi: 75
              end
     end
  end

  def pdf
     @new_picture = Picture.new
    @tribe = current_user.tribe
    @newspaper = @tribe.newspapers.last
  end

  def box_photo
      pic = Picture.find params[:picture_id]
      pic.update(box_id: params[:box_id])
    end
end
