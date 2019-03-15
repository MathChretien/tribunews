class PagesController < ApplicationController
  def index
  end

  def show
    @testtribe = Tribe.create!
    @testpaper = Newspaper.create!(tribe: @testtribe)
    @testpage = Page.create!(newspaper: @testpaper)
    @box_02 = Box.create!(page: @testpage, content_text: "hellooo")
  end

  def edit
  end

  def update
  end
end
