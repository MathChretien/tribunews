class NewspapersController < ApplicationController
  def index
  end

  def show
    @new_picture = Picture.new
    @tribe = current_user.tribe
    @newspaper = @tribe.newspapers.last
    @page = @newspaper.pages.first
  end



end
