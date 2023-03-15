class Users::RegistrationsController < Devise::RegistrationsController


def create
    super do |resource|
      UserMailer.welcome_email(resource)
    end
  end


  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: {
      message: 'Signed up sucessfully.',
      user: current_user
    }, status: :ok
  end

  def register_failed
    render json: { message: 'Signed failled.' }, status: :unprocessable_entity
  end
end
