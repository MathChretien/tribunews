class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def show
    @page = Page.find params[:page_id]

  end

  def edit
  end

  def update
  end

  def change_layout
    page = Page.find params[:layout_picker][:page_id]
    page.update!(layout: params[:layout_picker][:page_layout])

    redirect_to newspapers_show_path(page_number: params[:layout_picker][:page_number])
  end
end
