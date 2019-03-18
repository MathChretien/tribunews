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
    puts "paramsssss"
    puts params
    page_layout = Page.find params[:page_id]
    page_layout.update!(layout: params[:layout])
    page_layout.save!
  end

end
