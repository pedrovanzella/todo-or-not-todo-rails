class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  respond_to :htlm, only: []
  respond_to :xml, only: []

  before_filter :not_allowed, only: [:new, :edit, :cancel]

  def not_allowed
    raise MethodNotAllowed
  end

  private

  def sign_up_params
    params.permit([
                    :email,
                    :password,
                    :password_confirmation,
                    :full_name
                  ])
  end

  def account_update_params
    params.permit([
                    :email,
                    :full_name
                  ])
  end
end
