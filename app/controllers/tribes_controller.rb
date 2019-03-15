class TribesController < ApplicationController
  def index
    redirect_to tribe_path(current_user.tribe) if current_user
  end

  def show
    @new_user = User.new
  end

  def new
  end

  def create
  end

  def edit
    raise
  end

  def update
  end

  def destroy
  end
end
