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
    page = Page.find params[:page_id]
    # binding.pry
    page.update!(layout: params[:page_layout])
  end
end
