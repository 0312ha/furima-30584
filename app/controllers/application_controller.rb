class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :familyname_kanji, :firstname_kanji, :familyname_kana, :firstname_kana, :birthday])
  end
end
