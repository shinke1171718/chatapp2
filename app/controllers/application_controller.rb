class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
    end

    def after_sign_in_path_for(resource)
      flash[:alret] = "ログインに成功しました"
      user_path(1)
    end
  
    def after_sign_out_path_for(resource)
      new_user_session_path
    end
end
