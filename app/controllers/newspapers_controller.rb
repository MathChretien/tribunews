class NewspapersController < ApplicationController
  layout 'pdf', only: :pdf
  skip_before_action :verify_authenticity_token

  def index
  end

  def show
    @new_picture = Picture.new
    @tribe = current_user.tribe
    @newspaper = @tribe.newspapers.first # normally: last but we work with 1
    if params[:page_nr].nil?
      @page = @newspaper.pages.first
    else
      @page = @newspaper.pages[:page_nr]
    end
    @pic_boxes = get_boxes(@page, :pic)
    @text_boxes = get_boxes(@page, :text)

    # respond_to  do |format|
    #   format.html
    #   format.pdf do
    #               render pdf: "titre newspaper",
    #               page_size: 'A4',
    #               template: "newspapers/pdf.html.erb",
    #               layout: "pdf.html",
    #               lowquality: true,
    #               zoom: 1,
    #               dpi: 75
    #           end
    #  end
  end

  def destroy
      tribe = current_user.tribe
      newspaper = tribe.newspapers.last
      @pic = newspaper.pictures.find(params[:id].to_i)
      @pic.destroy
      redirect_to newspapers_show_path
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


private

  def get_boxes(page, category)
    res = []
    page.boxes.each do |b|
      if category == :pic && !b.picture.nil?
        res << b

      elsif category == :text && b.category == "text"
        res << b
      end
    end
    return res

  end

end
