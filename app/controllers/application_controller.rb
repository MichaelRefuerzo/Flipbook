class ApplicationController < ActionController::Base
    before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

    protected

    def after_sign_in_path_for(resource)
        flipbooks_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :student_id, :middle_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :student_id, :middle_name])
    end

end
