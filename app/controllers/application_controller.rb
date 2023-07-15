class ApplicationController < ActionController::Base
  layout :layout_for_devise

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  def after_sign_in_path_for(resource)
    '/dashboard' # Ganti dengan rute yang sesuai dengan kebutuhan Anda
  end


  private

  def layout_for_devise
    devise_controller? ? 'devise' : 'application'
  end
end
