# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  layout 'dummy'
  # GET /resource/sign_in
  # def new
  #   super do |resource|
  #     unless resource.approved?
  #       return dest
  #     end
  #   end
  # end

  # POST /resource/sign_in
  def create
    super do |resource|
      unless resource.approved?
        sign_out
        return redirect_to static_pages_unauthorized_path
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
