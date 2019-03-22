  class NewspapersController < ApplicationController
  layout 'pdf', only: :pdf
  skip_before_action :verify_authenticity_token

  def index
  end

  def show
    @no_footer = true
    @new_picture = Picture.new
    @tribe = current_user.tribe
    @newspaper = @tribe.newspapers.last # normally: last but we work with 1


    if params[:page_number].nil?
      @page = @newspaper.pages.first
    else
      new_page_nr = params[:page_number].to_i
      @page = @newspaper.pages.where(number: new_page_nr).first
    end
    @pic_boxes = get_boxes(@page, :pic)
    @text_boxes = get_boxes(@page, :text)

     respond_to  do |format|
      format.html
      format.pdf do
                   render pdf: "test newspaper",
                   show_as_html: false,         # allow debugging based on url param
                   page_size: 'A4',
                   template: "newspapers/pdf.html.erb",
                   layout: "pdf.html",
                   lowquality: true,
                   zoom: 1.635,
                   :margin => {:top            => 0,                         # default 10 (mm)
                           :bottom             => 0,
                           :left               => 0,
                           :right              => 0}
               end
      end
  end

  def destroy
    tribe = current_user.tribe
    newspaper = tribe.newspapers.last
    @pic = newspaper.pictures.find(params[:id].to_i)
    @pic.destroy
    # redirect_to newspapers_show_path(page_number: params[:page_number])
    redirect_back fallback_location: "newspapers/show?page_number=@page"

  end

  def pdf
   @new_picture = Picture.new
   @tribe = current_user.tribe
   @newspaper = @tribe.newspapers.last

 end

 def box_photo
  pic = Picture.find params[:pic][:picture_id]
  pic.update(box_id: params[:pic][:box_id])
  box = Box.find params[:pic][:box_id]
  box.update(category: params[:pic][:category])
  redirect_to newspapers_show_path(page_number: params[:pic][:page_number])
end

def back_library
  pic = Picture.find params[:photo_box][:picture_id]
  pic.update(box_id: params[:box_id], box_id: nil)
  redirect_to newspapers_show_path(page_number: params[:photo_box][:page_number])

end

private

  def get_boxes(page, category)
    res = []
    page.boxes.order("id ASC").each do |b|
      if category == :pic && !b.picture.nil?
        res << b
      elsif category == :text && b.category == "text"
        res << b
      end
  end
  return res

end
end
