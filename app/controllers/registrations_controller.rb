class RegistrationsController < Devise::RegistrationsController

  def new
    @new_resource = User.new
    @new_resource.build_tribe
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation,:first_name, :last_name, tribe_attributes: [:name] )
  end
end
