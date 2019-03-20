class TribesController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :set_tribe
  def index
    # redirect_to tribe_path(current_user.tribe) if current_user
  end

  def show
    @message = Message.new
    @new_user = User.new
  end

  def new
  end

  def create
  end

  def edit
    @tribes = Tribe.find(params[:id])
  end

  def update
    @tribes = Tribe.find(params[:id])
    @tribes.update!(user_params)
    redirect_to tribe_path(current_user.tribe) if current_user
  end

  def destroy
  end

  def set_tribe
      @tribe = current_user.tribe if current_user
  end

  private

  def user_params
    params.require(:tribe).permit(:name, :address, :photo, :description)
  end
end
