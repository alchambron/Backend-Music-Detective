class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      UserMailer.welcome_email(resource)
    end
  end

  def update
    if current_user.update(user_params)
      render(json: { message: 'User information updated successfully.', user: current_user }, status: :ok)
    else
      render(json: { message: 'Unable to update user information.' }, status: :unprocessable_entity)
    end
  end

  def destroy
    current_user.destroy
    render(json: { message: 'User deleted successfully' }, status: :ok)
  end

  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render(json: { message: 'Signed up sucessfully.', user: current_user }, status: :ok)
  end

  def register_failed
    render(json: { message: 'Signed failled.' }, status: :unprocessable_entity)
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end
end
