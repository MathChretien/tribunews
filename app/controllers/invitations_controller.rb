class InvitationsController < Devise::InvitationsController
  def new
    super
  end

  def create
    @new_resource = User.new(sign_up_params)
    @new_resource.tribe = Tribe.find(params[:user][:tribe_id])
    @new_resource.invite!(@new_resource)
    redirect_to tribe_path(current_user)
  end

  private
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation,:first_name, :last_name, :tribe_id )
  end
end
