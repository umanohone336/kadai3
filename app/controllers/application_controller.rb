class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # after_sign_out_path_forはafter_sign_in_path_forと同じくDeviseが用意しているメソッドで
# サインアウト後にどこに遷移するかを設定するメソッドです。
  def after_sign_out_path_for(resource)
    root_path
  end

# after_sign_in_path_forはDeviseが用意しているメソッドで、サインイン後にどこに遷移するかを設定しているメソッドです。
  def after_sign_in_path_for(resource)
    user_path(resource)#ログイン後マイページ
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
