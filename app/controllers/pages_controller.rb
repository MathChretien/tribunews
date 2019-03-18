class PagesController < ApplicationController
  def index
  end

  def show
    # @testtribe = Tribe.create!
    # @testpaper = Newspaper.create!(tribe: @testtribe)
    # @testpage = Page.create!(newspaper: @testpaper)
    # @box_02 = Box.create!(page: @testpage, content_text: "hellooo")
  end

  def edit
  end

  def update
  end

  def change_layout
    page_layout = Page.find params[:page_id]
    page_layout.update(layout: params[:layout])
  end

end
