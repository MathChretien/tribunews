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

  def update_resource_params
    params.require(:user).permit(:email, :invitation_token, :password, :photo, :password_confirmation, :first_name, :last_name, :tribe_id )
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :photo, :password_confirmation, :first_name, :last_name, :tribe_id )
  end
end
